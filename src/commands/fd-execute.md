---
description: Implémente une story strictement selon son plan validé
argument-hint: <story-id>
---

Phase EXECUTE pour la story $ARGUMENTS.

1. Vérifie que `docs/plans/$ARGUMENTS.md` existe et que `validated: yes`.
   Si ce n'est pas le cas : STOP, explique pourquoi, et redirige vers
   /fd-plan $ARGUMENTS. N'implémente rien.
2. Implémente exactement les étapes du plan, dans l'ordre prévu. Si tu
   dois t'écarter du plan, arrête-toi et signale l'écart plutôt que de
   continuer silencieusement.
3. Respecte `docs/standards.md` (clean code) tout du long — la skill
   `clean-code` s'applique automatiquement.
4. Ne marque rien comme terminé ici : /fd-test, /fd-review, /fd-security,
   /fd-doc et /fd-ship restent à faire.
