---
description: Génère ou met à jour l'infra (Docker, CI/CD, variables d'environnement)
---

Phase INFRA.

1. Lis `docs/architecture.md` pour connaître la stack et les services
   nécessaires (base de données, cache, files, etc.).
2. Génère/actualise selon le besoin : Dockerfile (image minimale,
   multi-stage si pertinent), docker-compose pour le dev local, config CI
   (lint + tests + build), gestion des variables d'environnement
   (`.env.example`, jamais de valeurs réelles committées).
3. Documente les décisions dans `docs/infra.md` à partir de
   `docs/templates/infra.md` (services, ports, dépendances externes).
4. Applique les mêmes exigences que la skill `infra-guard` : pas de
   secret en dur, healthchecks définis, image la plus petite possible.
5. Peut être relancé à chaque fois que l'infra évolue, pas seulement au
   démarrage du projet.
