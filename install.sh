#!/usr/bin/env bash
# flash-dev — installeur
# Usage: voir README.md / `install.sh --help`
set -euo pipefail

FLASH_DEV_REPO="${FLASH_DEV_REPO:-https://github.com/<ton-user>/flash-dev}"
FLASH_DEV_BRANCH="${FLASH_DEV_BRANCH:-main}"
FLASH_DEV_VERSION="0.1.0"

SCOPE="project"
ACTION="install"
HOOKS=0
FORCE=0

usage() {
  cat <<'USAGE'
Usage: install.sh [update|init] [--global] [--hooks] [--force]

  (aucune action)   installe commandes + skills (+ règles/templates en scope projet)
  update            met à jour une installation existante
  init              (après --global) dépose les fichiers de projet (règles, templates, hooks)

  --global           installe dans ~/.claude au lieu du projet courant
  --hooks            active les git hooks d'enforcement (pre-commit/pre-push)
  --force            (avec update) écrase aussi les templates modifiés localement
USAGE
}

for arg in "$@"; do
  case "$arg" in
    --global) SCOPE="global" ;;
    --hooks)  HOOKS=1 ;;
    --force)  FORCE=1 ;;
    update)   ACTION="update" ;;
    init)     ACTION="init" ;;
    -h|--help) usage; exit 0 ;;
    *) echo "[flash-dev] option inconnue: $arg" >&2; usage; exit 1 ;;
  esac
done

resolve_source() {
  local here
  here="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
  if [ -d "$here/src" ]; then
    printf '%s\n' "$here"
    return
  fi
  local tmp dir
  tmp="$(mktemp -d)"
  if command -v git >/dev/null 2>&1; then
    git clone --depth 1 --branch "$FLASH_DEV_BRANCH" "$FLASH_DEV_REPO" "$tmp/repo" >/dev/null 2>&1 \
      || { echo "[flash-dev] ERREUR: impossible de cloner $FLASH_DEV_REPO" >&2; exit 1; }
    printf '%s\n' "$tmp/repo"
  else
    curl -fsSL "$FLASH_DEV_REPO/archive/refs/heads/$FLASH_DEV_BRANCH.tar.gz" | tar -xz -C "$tmp" \
      || { echo "[flash-dev] ERREUR: impossible de télécharger $FLASH_DEV_REPO" >&2; exit 1; }
    dir="$(find "$tmp" -mindepth 1 -maxdepth 1 -type d | head -n1)"
    printf '%s\n' "$dir"
  fi
}

SRC="$(resolve_source)"
# shellcheck source=bin/lib.sh
source "$SRC/bin/lib.sh"

if [ "$SCOPE" = "global" ]; then
  CMD_DIR="$HOME/.claude/commands"
  SKILL_DIR="$HOME/.claude/skills"
else
  CMD_DIR=".claude/commands"
  SKILL_DIR=".claude/skills"
fi

install_commands() {
  mkdir -p "$CMD_DIR"
  for f in "$SRC"/src/commands/*.md; do
    fd_copy_tracked "$f" "$CMD_DIR/$(basename "$f")" "$FORCE"
  done
}

install_skills() {
  mkdir -p "$SKILL_DIR"
  for d in "$SRC"/src/skills/*/; do
    name="$(basename "$d")"
    fd_copy_tracked "${d}SKILL.md" "$SKILL_DIR/$name/SKILL.md" "$FORCE"
  done
}

install_templates() {
  mkdir -p docs/templates
  for f in "$SRC"/src/templates/*.md; do
    fd_copy_tracked "$f" "docs/templates/$(basename "$f")" "$FORCE"
  done
}

install_project_files() {
  if [ ! -f "AGENTS.md" ]; then
    cp "$SRC/AGENTS.md" AGENTS.md
    fd_log "AGENTS.md créé"
  else
    fd_log "AGENTS.md existe déjà, non touché (merge manuel si la méthode évolue)"
  fi

  if [ ! -f "CLAUDE.md" ]; then
    printf '%s\n' "@AGENTS.md" > CLAUDE.md
    fd_log "CLAUDE.md créé (importe AGENTS.md)"
  fi

  install_templates
}

install_hooks() {
  [ "$HOOKS" = "1" ] || return 0
  command -v git >/dev/null 2>&1 || { fd_die "git requis pour --hooks"; }
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { fd_die "--hooks doit être lancé dans un repo git"; }
  mkdir -p .githooks
  cp "$SRC/src/hooks/pre-commit" .githooks/pre-commit
  cp "$SRC/src/hooks/pre-push" .githooks/pre-push
  chmod +x .githooks/pre-commit .githooks/pre-push
  git config core.hooksPath .githooks
  fd_log "git hooks activés (core.hooksPath=.githooks)"
}

do_install() {
  install_commands
  install_skills
  if [ "$SCOPE" = "project" ]; then
    install_project_files
    install_hooks
  fi
  fd_stamp_version "$FLASH_DEV_VERSION"
  fd_log "installation terminée (scope=$SCOPE)"
}

do_init() {
  SCOPE="project"
  CMD_DIR=".claude/commands"
  SKILL_DIR=".claude/skills"
  install_project_files
  install_hooks
  fd_stamp_version "$FLASH_DEV_VERSION"
  fd_log "fichiers de projet initialisés"
}

do_update() {
  [ -f "$FD_VERSION_FILE" ] || fd_warn "aucune installation détectée ($FD_VERSION_FILE absent), poursuite quand même"
  install_commands
  install_skills
  install_templates
  fd_stamp_version "$FLASH_DEV_VERSION"
  fd_log "mise à jour terminée"
}

case "$ACTION" in
  install) do_install ;;
  init)    do_init ;;
  update)  do_update ;;
esac
