---
description: Carte du pipeline flash-dev et aide-mémoire des commandes
---

Affiche la carte du pipeline flash-dev :

Cadrage (une fois par projet) :
  /fd-init → /fd-prd → /fd-stories → /fd-stories-review → /fd-architect →
  /fd-design-system → /fd-standards

Cycle par story :
  /fd-research <id> → /fd-design <id> → /fd-plan <id> → /fd-execute <id> →
  /fd-test <id> → /fd-review <id> → /fd-security <id> → /fd-doc <id> →
  /fd-ship <id>

  Ou en un bloc : /fd-orchestrator <id> (avec checkpoints humains).

Infra (au besoin, pas seulement au démarrage) :
  /fd-infra — Docker, CI/CD, variables d'environnement
  /fd-deploy [env] — checklist et mise en production

Transverse :
  /fd-status — état de chaque story
  /fd-backlog — gérer la roadmap

Rappelle en une ligne le principe : aucun code hors du pipeline validé
(voir AGENTS.md). Renvoie vers DOC.md pour le détail.
