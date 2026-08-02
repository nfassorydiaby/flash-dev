---
description: Écrit et exécute les tests d'une story, rapporte la couverture
argument-hint: <story-id>
---

Phase TEST pour la story $ARGUMENTS.

1. Lis `docs/plans/$ARGUMENTS.md` pour connaître le périmètre attendu.
2. Écris les tests manquants (unitaires puis intégration) couvrant les
   critères d'acceptation de la story dans `docs/stories.md`.
3. Exécute la suite de tests complète, pas seulement les nouveaux tests.
4. Rapporte : tests ajoutés, résultat (pass/fail), couverture si l'outil
   le permet. Si des tests échouent, ne continue pas vers /fd-review tant
   que ce n'est pas corrigé (retour à /fd-execute si besoin).
