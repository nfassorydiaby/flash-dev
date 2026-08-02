---
name: test-writer
description: Se déclenche quand une story entre en phase de test ou qu'une régression est détectée. Garantit que les critères d'acceptation sont couverts par des tests avant de considérer une story testée.
---

1. Retrouve les critères d'acceptation de la story dans `docs/stories.md`.
2. Vérifie qu'un test existe pour chacun ; écris ceux qui manquent
   (cas nominal, cas limites, cas d'erreur).
3. Privilégie des tests rapides et déterministes ; isole les dépendances
   externes (réseau, horloge, aléatoire).
4. N'affaiblis jamais un test existant pour le faire passer — corrige le
   code ou signale le désaccord.
