<script lang="ts">
  import SeoHead from '$components/SEOHead.svelte'
  import { m } from '$lib/i18n/messages'

  // Bayes Impact override: content is hardcoded in French (FR-first deploy
  // targeting hospital professionals). Upstream i18n keys are intentionally
  // unused here.
</script>

<SeoHead title={m['seo.titles.mentions-legales']()} />

<main class="py-10 lg:py-15">
  <div class="fr-container">
    <h1 id="mentions-legales" class="fr-h2">Mentions légales</h1>

    <h2 id="editeur" class="fr-h5">Éditeur</h2>
    <p>
      Le présent site est édité par <strong>Bayes Impact France</strong>,
      association à but non lucratif régie par la loi du 1<sup>er</sup> juillet
      1901 (SIREN 813&nbsp;821&nbsp;279), dont le siège est situé au
      12 rue des Jeûneurs, 75002 Paris, France.
    </p>
    <p>Directeur de la publication : Paul Duan.</p>
    <p>
      Contact : <a href="mailto:hello@bayesimpact.org">hello@bayesimpact.org</a>
    </p>

    <h2 id="hebergement" class="fr-h5">Hébergement</h2>
    <p>
      Ce service est hébergé sur des infrastructures situées en France, sous
      administration directe de l'éditeur. Aucune donnée n'est transférée en
      dehors de l'Union européenne sans base légale appropriée.
    </p>

    <h2 id="responsable-traitement" class="fr-h5">Responsable de traitement</h2>
    <p>
      Bayes Impact agit en tant que responsable de traitement au sens du RGPD
      pour les données collectées via ce site. Pour en savoir plus, consultez
      notre <a href="/donnees-personnelles">politique de confidentialité</a>.
    </p>

    <h2 id="dpo" class="fr-h5">Délégué à la protection des données</h2>
    <p>
      Pour toute question relative aux données personnelles, contactez le
      DPO de Bayes Impact :
      <a href="mailto:dpo@bayesimpact.org">dpo@bayesimpact.org</a>
    </p>

    <h2 id="propriete-intellectuelle" class="fr-h5">Propriété intellectuelle</h2>
    <p>
      Sauf mention contraire, les contenus de ce site sont protégés par le droit
      d'auteur. Toute reproduction, distribution, modification ou adaptation
      nécessite une autorisation écrite préalable de l'éditeur.
    </p>

    <h2 id="code-source" class="fr-h5">Code source</h2>
    <p>
      Ce service est un fork du projet <em>compar:IA</em> (betagouv) adapté
      au contexte de l'évaluation clinique. Le code source de compar:IA est
      publié sous licence Etalab 2.0 ; le code de ce fork est disponible sur
      <a href="https://github.com/bayesimpact/ComparIA" target="_blank" rel="noopener external">GitHub</a>.
    </p>

    <h2 id="responsabilite" class="fr-h5">Responsabilité</h2>
    <p>
      L'éditeur décline toute responsabilité quant à la disponibilité continue
      du service ainsi qu'au contenu des sites tiers accessibles via des liens
      externes.
    </p>

    <h2 id="droit-applicable" class="fr-h5">Droit applicable</h2>
    <p>
      Les présentes mentions légales sont régies par le droit français. Tout
      litige relatif à leur interprétation ou à leur exécution relève de la
      compétence des tribunaux français.
    </p>
  </div>
</main>
