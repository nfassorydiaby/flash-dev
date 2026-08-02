---
description: Dashboard de l'état réel de chaque story
---

Phase STATUS.

1. Lis `docs/stories.md` pour la liste des stories.
2. Pour chaque story, déduis son état réel en inspectant le disque (pas
   de mémoire) : présence/contenu de `docs/research/<id>.md`,
   `docs/plans/<id>.md` (`validated`), tests, `docs/reviews/<id>.md`
   (`Ship allowed`), état dans `docs/stories.md`.
3. Affiche un tableau : story · état (todo/researched/planned/validated/
   executed/tested/reviewed/secured/documented/shipped) · bloquant
   éventuel.
4. Signale les incohérences (ex: `Ship allowed: yes` mais tests
   manquants).
