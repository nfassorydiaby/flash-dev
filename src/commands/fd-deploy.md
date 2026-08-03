---
description: Checklist et automatisation de mise en production
argument-hint: [environnement]
---

Phase DEPLOY vers $ARGUMENTS (staging par défaut si non précisé).

1. Vérifie les prérequis : toutes les stories du périmètre concerné sont
   `shipped` (voir /fd-status), CI verte, variables d'environnement de la
   cible présentes et documentées dans `docs/infra.md`.
2. Décris/exécute la procédure de déploiement (build, migration si
   besoin, bascule, rollback) selon ce qui est déjà en place dans le
   projet — ne réinvente pas un pipeline si un existe déjà.
3. Vérifie après coup : healthcheck OK, pas de régression visible
   immédiate.
4. Documente toute procédure de rollback utilisée ou à connaître.
5. Ne déploie jamais en prod si un doute de sécurité (/fd-security) n'a
   pas été levé.
