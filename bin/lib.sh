#!/usr/bin/env bash
# flash-dev — fonctions partagées par install.sh
# Ne pas exécuter directement : ce fichier est sourcé par install.sh.

FD_MANIFEST=".fd-manifest"
FD_VERSION_FILE=".fd-version"

fd_log()  { echo "[flash-dev] $*"; }
fd_warn() { echo "[flash-dev] ATTENTION: $*" >&2; }
fd_die()  { echo "[flash-dev] ERREUR: $*" >&2; exit 1; }

fd_sha() {
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | awk '{print $1}'
  else
    shasum -a 256 "$1" | awk '{print $1}'
  fi
}

# fd_manifest_get <path> -> renvoie le hash enregistré à l'install, ou ""
fd_manifest_get() {
  local path="$1"
  [ -f "$FD_MANIFEST" ] || return 0
  awk -F'\t' -v p="$path" '$1 == p {print $2}' "$FD_MANIFEST"
}

# fd_manifest_set <path> <hash> -> met à jour (ou ajoute) une entrée du manifest
fd_manifest_set() {
  local path="$1" hash="$2" tmp
  tmp="$(mktemp)"
  [ -f "$FD_MANIFEST" ] && grep -v -F -- "$(printf '%s\t' "$path")" "$FD_MANIFEST" > "$tmp" || true
  printf '%s\t%s\n' "$path" "$hash" >> "$tmp"
  sort -o "$tmp" "$tmp"
  mv "$tmp" "$FD_MANIFEST"
}

# fd_copy_tracked <src> <dest> <force:0|1>
# Copie src -> dest. Si dest existe déjà et a été modifié localement
# (hash différent du hash connu au dernier install), ne l'écrase pas
# sauf si force=1. Met à jour le manifest dans tous les cas où on écrit.
fd_copy_tracked() {
  local src="$1" dest="$2" force="${3:-0}"
  mkdir -p "$(dirname "$dest")"

  if [ -f "$dest" ]; then
    local known current
    known="$(fd_manifest_get "$dest")"
    current="$(fd_sha "$dest")"
    if [ -n "$known" ] && [ "$known" != "$current" ] && [ "$force" != "1" ]; then
      fd_warn "$dest modifié localement, ignoré (utilise --force pour écraser)"
      return 0
    fi
  fi

  cp "$src" "$dest"
  fd_manifest_set "$dest" "$(fd_sha "$dest")"
}

fd_stamp_version() {
  echo "${1:-dev}" > "$FD_VERSION_FILE"
}
