---
description: Gate final — merge/release seulement si tous les contrôles passent
argument-hint: <story-id>
---

Phase SHIP pour la story $ARGUMENTS.

1. Vérifie : `docs/plans/$ARGUMENTS.md` a `validated: yes`, /fd-test est
   passé sans échec, `docs/reviews/$ARGUMENTS.md` a `Ship allowed: yes`,
   /fd-doc a été fait si nécessaire.
2. Si un seul de ces points manque : STOP, liste précisément ce qui
   bloque, et redirige vers la commande correspondante. Ne force jamais
   le ship.
3. Si tout est vert : prépare le message de commit/PR, résume les
   changements, et marque la story `shipped` dans `docs/stories.md`.
4. Rappel : si les git hooks (--hooks) sont installés, ce gate est aussi
   vérifié indépendamment par `pre-push`.
