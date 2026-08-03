---
description: Produit un plan d'implémentation pour une story (gate de validation)
argument-hint: <story-id>
---

Phase PLAN pour la story $ARGUMENTS.

1. Lis `docs/stories.md`, `docs/research/$ARGUMENTS.md` et
   `docs/designs/$ARGUMENTS.md` (si présents). Si la story a un impact
   visible et qu'aucun `docs/designs/$ARGUMENTS.md` n'existe, arrête-toi
   et redirige vers /fd-design $ARGUMENTS avant de continuer.
2. Découpe l'implémentation en étapes concrètes : fichiers impactés,
   ordre des changements, tests à écrire, risques et plan de repli.
3. Écris `docs/plans/$ARGUMENTS.md` à partir de `docs/templates/plan.md`.
4. Termine impérativement le champ `validated: no`. Seul un humain peut
   le passer à `yes` après relecture — voir AGENTS.md, gate obligatoire
   avant /fd-execute.
5. N'écris et ne modifie aucun fichier de code dans cette commande.
