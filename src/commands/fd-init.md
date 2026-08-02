---
description: Bootstrap un nouveau projet (scaffolding, config, CI, baseline sécurité)
argument-hint: [nom-du-projet]
---

Phase INIT — cadrage, une fois par projet.

1. Si le dossier courant est vide ou neuf : propose une stack raisonnable
   selon le contexte (langage, framework, gestionnaire de paquets) et
   demande confirmation avant de scaffolder.
2. Crée l'arborescence de base, un README minimal, un `.gitignore` adapté,
   un linter/formatter configuré, et une CI minimale (lint + tests).
3. Pose une baseline sécurité : scanning de secrets, mise à jour des
   dépendances activée (dependabot ou équivalent), pas de secret en dur.
4. Ne crée aucune logique métier ici — seulement le socle. Les
   fonctionnalités passent par /fd-prd → /fd-stories → le cycle par story.
5. Termine par un résumé de ce qui a été créé et les prochaines étapes
   (`/fd-prd`).
