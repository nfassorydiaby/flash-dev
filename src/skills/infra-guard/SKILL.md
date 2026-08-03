---
name: infra-guard
description: Se déclenche dès qu'on touche à un Dockerfile, une config CI/CD, ou des variables d'environnement. Vérifie les bonnes pratiques infra avant de continuer.
---

Dès que le contexte touche Docker, CI/CD ou variables d'environnement :

1. Aucun secret (clé API, mot de passe, token) en dur dans une image,
   un Dockerfile ou un fichier de config versionné — utilise des
   variables d'environnement injectées à l'exécution.
2. Image Docker la plus petite/simple possible (multi-stage build,
   image de base minimale, pas de dépendances de dev en prod).
3. Healthcheck défini pour tout service qui tourne en continu.
4. `.env.example` tenu à jour à chaque nouvelle variable d'environnement
   ajoutée — jamais de vraies valeurs committées.
5. Toute étape de CI qui échoue silencieusement (erreurs avalées) est un
   problème à signaler, pas à ignorer.
