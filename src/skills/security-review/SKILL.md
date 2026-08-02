---
name: security-review
description: Se déclenche dès que le code touche l'authentification, des secrets, des dépendances ou des entrées utilisateur non validées. Vérifie les risques de sécurité courants avant de continuer.
---

Dès que le contexte touche auth, secrets, dépendances ou entrées
utilisateur :

1. Aucun secret en dur (clé API, mot de passe, token) — utilise des
   variables d'environnement / un gestionnaire de secrets.
2. Toute entrée utilisateur est validée/échappée avant usage (requêtes,
   commandes shell, rendu HTML, désérialisation).
3. Les contrôles d'accès (authn/z) sont vérifiés à chaque point d'entrée
   sensible, pas seulement à la connexion.
4. Toute nouvelle dépendance ou mise à jour est vérifiée pour des
   vulnérabilités connues avant d'être ajoutée.
5. En cas de doute sérieux, arrête-toi et signale plutôt que de supposer
   que c'est sans risque.
