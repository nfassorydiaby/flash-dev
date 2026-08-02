---
description: Enchaîne le cycle complet d'une story avec des checkpoints humains
argument-hint: <story-id>
---

Phase ORCHESTRATOR pour la story $ARGUMENTS.

Enchaîne, dans l'ordre, /fd-research, /fd-plan, /fd-execute, /fd-test,
/fd-review, /fd-security, /fd-doc, /fd-ship pour la story $ARGUMENTS —
mais respecte les checkpoints humains :

1. Après /fd-plan : arrête-toi et attends la validation explicite du plan
   (`validated: yes`) avant de lancer /fd-execute. Ne valide jamais un
   plan à la place de l'utilisateur.
2. Après /fd-review et /fd-security : si un point bloquant apparaît,
   arrête-toi et attends une décision plutôt que de continuer vers
   /fd-ship.
3. Avant /fd-ship : résume ce qui a été fait à chaque étape et demande
   confirmation finale.
4. À tout moment, /fd-status peut être appelé pour voir où en est la
   story.
