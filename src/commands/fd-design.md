---
description: Traduit une story en spec de design avant l'implémentation
argument-hint: <story-id>
---

Phase DESIGN pour la story $ARGUMENTS.

1. Lis `docs/stories.md`, `docs/research/$ARGUMENTS.md` (si présent) et
   `docs/design-system.md` (si présent).
2. Si la story n'a aucun impact visible (API interne, script, migration
   technique), dis-le explicitement et passe directement à /fd-plan —
   inutile de forcer une spec de design.
3. Sinon, décris : flux d'interaction, composants utilisés/nouveaux,
   états (chargement, erreur, vide, succès), alignement avec
   `docs/design-system.md` (ou écarts justifiés).
4. Écris `docs/designs/$ARGUMENTS.md` à partir de
   `docs/templates/design.md`.
5. N'écris et ne modifie aucun fichier de code dans cette commande.
6. Termine en recommandant la suite : /fd-plan $ARGUMENTS.
