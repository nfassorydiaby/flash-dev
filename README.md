# flash-dev

Un pipeline agentique complet pour piloter un projet du premier commit à la
prod : nouveaux projets, nouvelles fonctionnalités, tests, documentation,
gestion de projet, clean code, sécurité. Un seul principe : **aucun code
n'est écrit hors du pipeline validé**.

## Pipeline

```
Cadrage (une fois par projet)
  PRD → Stories → Stories Review → Architecture → Standards

Par story (cycle répété)
  Research → Plan (validé) → Execute → Test → Review → Security → Doc → Ship

Transverse
  Status · Backlog · Orchestrator
```

Doc complète : [DOC.md](DOC.md)

## Install

Depuis la racine de ton projet :

```bash
cd mon-projet
curl -fsSL https://raw.githubusercontent.com/<ton-user>/flash-dev/main/install.sh | bash
```

Ou en clonant d'abord :

```bash
git clone https://github.com/<ton-user>/flash-dev.git ~/tools/flash-dev
cd mon-projet
~/tools/flash-dev/install.sh
```

### Scope et enforcement

```bash
./install.sh                 # projet (défaut) : .claude/commands + .claude/skills
./install.sh --global        # global : ~/.claude/commands + ~/.claude/skills
./install.sh --hooks         # + git hooks (pre-commit / pre-push), voir DOC.md
```

Après un install global, dépose les fichiers par projet (templates + règles) :

```bash
~/.claude/flash-dev/install.sh init
```

## Update

```bash
~/tools/flash-dev/install.sh update
# ou sans clone :
curl -fsSL https://raw.githubusercontent.com/<ton-user>/flash-dev/main/install.sh | bash -s -- update
# pour écraser aussi les templates modifiés localement :
curl -fsSL https://raw.githubusercontent.com/<ton-user>/flash-dev/main/install.sh | bash -s -- update --force
```

Un template modifié localement n'est jamais écrasé sans `--force`.
`AGENTS.md` n'est jamais touché par `update` : si les règles évoluent, on
merge à la main.

## Usage

```
# cadrage — une fois par projet
/fd-init
/fd-prd
/fd-stories
/fd-stories-review
/fd-architect
/fd-standards

# par story
/fd-research <story>
/fd-plan <story>
/fd-execute <story>
/fd-test <story>
/fd-review <story>
/fd-security <story>
/fd-doc <story>
/fd-ship <story>

# ou le cycle complet avec checkpoints humains
/fd-orchestrator <story>

# gestion de projet
/fd-status
/fd-backlog

# perdu ?
/fd-help
```

## Licence

MIT.
