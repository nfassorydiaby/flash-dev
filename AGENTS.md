# flash-dev — règles de la méthode

Ce fichier définit les règles que l'agent doit respecter sur ce projet.
Il est partagé entre tous les outils IA installés et importé par `CLAUDE.md`.

## Principe directeur : no direct coding

Aucune fonctionnalité produit n'est codée hors du pipeline `/fd-*`. Toute
demande de type "code-moi ça directement" pour une fonctionnalité doit être
redirigée vers `/fd-research` → `/fd-plan` → `/fd-execute`. Seules exceptions
explicites : fix de typo, config, ou ce que l'utilisateur qualifie lui-même
de "hors pipeline".

## États d'une story

todo → researched → designed → planned → validated → executed → tested →
reviewed → secured → documented → shipped

- `docs/designs/<id>.md` existe si la story a un impact visible (sinon
  `/fd-design` le documente explicitement et passe la main).
- `docs/plans/<id>.md` porte le champ `validated: yes|no`.
- `docs/reviews/<id>.md` porte le champ `Ship allowed: yes|no`.

## Gates obligatoires

1. `/fd-execute <id>` refuse de s'exécuter si `docs/plans/<id>.md` n'existe
   pas ou si `validated: no`.
2. `/fd-ship <id>` refuse si tests KO, review KO, ou sécurité KO.
3. Si `--hooks` est installé, ces gates sont *aussi* appliqués par git
   (pre-commit / pre-push), indépendamment du prompt de l'agent.

## Clean code

Toute modification de code doit respecter `docs/standards.md` (nommage,
complexité, duplication, formatage). La skill `clean-code` s'auto-déclenche
à chaque édition de fichier source.

## Sécurité

Aucun secret en dur, aucune dépendance non vérifiée, aucune entrée
utilisateur non validée sans traitement. La skill `security-review`
s'auto-déclenche sur tout code touchant l'auth, les entrées utilisateur,
les secrets ou les dépendances.

## Design

Toute story à impact visible passe par `/fd-design` avant `/fd-plan`, et
s'aligne sur `docs/design-system.md` (ou justifie ses écarts). Une story
sans impact visible peut sauter cette étape, mais doit le dire
explicitement plutôt que de l'ignorer silencieusement.

## Infra

Aucun secret en dur dans un Dockerfile, une config CI/CD ou une image.
La skill `infra-guard` s'auto-déclenche sur tout changement touchant
Docker, CI/CD ou variables d'environnement. `/fd-deploy` refuse une mise
en prod si un doute de sécurité n'a pas été levé (`/fd-security`).

## Documentation

Toute story qui change un comportement visible (API, CLI, config) doit
mettre à jour la doc correspondante avant `/fd-ship` (via `/fd-doc`).

## Gestion de projet

`docs/stories.md` est la seule source de vérité du backlog. `/fd-status`
doit toujours refléter l'état réel des fichiers sur disque, jamais un état
mémorisé par l'agent.
