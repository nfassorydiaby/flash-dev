---
description: Produit un plan d'implémentation pour une story (gate de validation)
argument-hint: <story-id>
---

Phase PLAN pour la story $ARGUMENTS.

1. Lis `docs/stories.md` et `docs/research/$ARGUMENTS.md` (si présent).
2. Découpe l'implémentation en étapes concrètes : fichiers impactés,
   ordre des changements, tests à écrire, risques et plan de repli.
3. Écris `docs/plans/$ARGUMENTS.md` à partir de `docs/templates/plan.md`.
4. Termine impérativement le champ `validated: no`. Seul un humain peut
   le passer à `yes` après relecture — voir AGENTS.md, gate obligatoire
   avant /fd-execute.
5. N'écris et ne modifie aucun fichier de code dans cette commande.
