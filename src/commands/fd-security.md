---
description: Revue sécurité (secrets, dépendances, authn/z, injections, OWASP)
argument-hint: <story-id>
---

Phase SECURITY pour la story $ARGUMENTS.

1. Vérifie systématiquement sur les fichiers modifiés par la story :
   secrets en dur, validation des entrées utilisateur, gestion des droits
   (authn/z), risques d'injection, dépendances nouvelles/mises à jour et
   leurs vulnérabilités connues.
2. Utilise une checklist type OWASP Top 10 adaptée au contexte du projet.
3. Complète `docs/reviews/$ARGUMENTS.md` (section sécurité) à partir de
   `docs/templates/review.md`.
4. Renseigne `Ship allowed: yes` uniquement si clean code (/fd-review) ET
   sécurité sont sans point bloquant ; sinon `Ship allowed: no` avec la
   liste des points à corriger.
