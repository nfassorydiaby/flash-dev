---
name: doc-writer
description: Se déclenche quand un comportement visible (API publique, CLI, configuration) change. Garantit que la documentation reste synchronisée avec le code.
---

1. Détecte si un changement modifie une interface visible : signature
   d'API publique, options CLI, variables de configuration, formats de
   données échangés.
2. Si oui, met à jour la documentation correspondante (README, doc API,
   changelog) dans le même changement — jamais dans un commit séparé
   "à faire plus tard".
3. Garde les exemples de la documentation exécutables/vérifiables quand
   c'est possible, plutôt que du texte qui peut se désynchroniser.
