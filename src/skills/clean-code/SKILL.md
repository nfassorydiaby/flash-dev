---
name: clean-code
description: Se déclenche dès qu'un fichier source est écrit ou modifié. Vérifie nommage, complexité, duplication, lisibilité et respect de docs/standards.md avant de considérer un changement de code terminé.
---

À chaque écriture/modification de code :

1. Lis `docs/standards.md` s'il existe et aligne-toi dessus (nommage,
   structure de dossiers, style, limites de complexité).
2. Vérifie : fonctions/méthodes trop longues ou trop complexes, code
   dupliqué, noms peu clairs, effets de bord non signalés, gestion
   d'erreurs absente ou silencieuse.
3. Corrige ce qui est mineur directement. Pour un refactor plus large,
   signale-le plutôt que de l'entreprendre hors du plan validé de la
   story en cours (voir AGENTS.md, principe "no direct coding").
4. Ne jamais sacrifier la lisibilité pour la concision.
