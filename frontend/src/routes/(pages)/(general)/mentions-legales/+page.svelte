<script lang="ts">
  import SeoHead from '$components/SEOHead.svelte'
  import { m } from '$lib/i18n/messages'

  // Bayes Impact / Impulse Healthtech override: content is hardcoded in French
  // (FR-first deploy targeting hospital professionals). Upstream i18n keys are
  // intentionally unused here.
</script>

<SeoHead title={m['seo.titles.mentions-legales']()} />

<main class="py-10 lg:py-15">
  <div class="fr-container">
    <h1 id="mentions-legales" class="fr-h2">Mentions légales</h1>

    <h2 id="editeur" class="fr-h5">Éditeur</h2>
    <p>
      Le présent site est édité par <strong>Bayes Impact</strong>, association
      loi 1901 dont le siège est situé à Paris, France, dans le cadre du
      programme <em>Impulse Healthtech</em>.
    </p>

    <h2 id="responsable-traitement" class="fr-h5">Responsable de traitement</h2>
    <p>Bayes Impact agit en tant que responsable de traitement au sens du RGPD pour les données collectées via ce site.</p>

    <h2 id="hebergement" class="fr-h5">Hébergement</h2>
    <p>
      Ce site est hébergé sur des infrastructures situées en France
      (Mac mini sous administration directe de l'éditeur, accès via Nginx
      reverse proxy). Aucune donnée n'est transférée en dehors de l'Union
      européenne sans base légale appropriée.
    </p>

    <h2 id="dpo" class="fr-h5">Délégué à la protection des données</h2>
    <p>
      Pour toute question relative aux données personnelles, contactez le
      DPO de Bayes Impact :
      <a href="mailto:dpo@bayesimpact.org">dpo@bayesimpact.org</a>
    </p>

    <h2 id="origine" class="fr-h5">Code source</h2>
    <p>
      Ce service est un fork du projet <em>compar:IA</em> (betagouv) adapté
      au contexte de l'évaluation clinique. Le code source de compar:IA est
      publié sous licence Etalab 2.0.
    </p>
  </div>
</main>
