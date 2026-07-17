<script lang="ts">
  import SeoHead from '$components/SEOHead.svelte'
  import { m } from '$lib/i18n/messages'

  // Bayes Impact override: RGPD notice rewritten for the medical/clinical
  // evaluation context of this platform. Upstream i18n keys are intentionally
  // unused here.
</script>

<SeoHead title={m['seo.titles.donnees-personnelles']()} />

<main class="py-10 lg:py-15">
  <div class="fr-container">
    <h1 id="politique-de-confidentialite">Protection des données personnelles</h1>

    <p>
      Cette politique décrit la manière dont Bayes Impact traite les données
      personnelles dans le cadre de cette plateforme, qui met à disposition des
      professionnels de santé un outil pour évaluer la pertinence et la fiabilité
      de grands modèles de langage (LLM) appliqués à l'information médicale.
    </p>

    <h2 id="responsable">Responsable de traitement</h2>
    <p>
      Le responsable de traitement est <strong>Bayes Impact France</strong>,
      association à but non lucratif régie par la loi du 1<sup>er</sup> juillet
      1901 (SIREN 813&nbsp;821&nbsp;279), dont le siège est situé à Paris. Pour
      toute question relative au traitement de vos données, vous pouvez contacter
      le délégué à la protection des données à l'adresse
      <a href="mailto:dpo@bayesimpact.org">dpo@bayesimpact.org</a>.
    </p>

    <h2 id="finalite">Finalité du traitement</h2>
    <p>
      Les données collectées sont traitées dans le but unique d'évaluer la
      qualité de grands modèles de langage appliqués à l'information médicale,
      notamment pour mesurer leur fiabilité clinique, leur sécurité et leur
      utilité décisionnelle pour les professionnels de santé hospitaliers.
    </p>

    <h2 id="base-legale">Base légale</h2>
    <p>
      Le traitement repose sur le <strong>consentement libre, spécifique,
      éclairé et univoque</strong> des testeurs, conformément à
      l'article&nbsp;6.1.a du Règlement général sur la protection des données
      (RGPD). Le consentement peut être retiré à tout moment, sans affecter la
      licéité du traitement effectué avant ce retrait.
    </p>
    <p>
      Concrètement : vos données ne sont collectées qu'à partir du moment où
      vous acceptez explicitement de participer aux tests, en connaissance de
      cause. Vous pouvez à tout moment arrêter de participer et demander la
      suppression de vos données déjà collectées, sans avoir à vous justifier
      et sans conséquence sur votre accès à la plateforme.
    </p>

    <h2 id="donnees-collectees">Données collectées</h2>
    <ul>
      <li>les prompts saisis par les testeurs (questions médicales) ;</li>
      <li>les réponses générées par les modèles comparés ;</li>
      <li>les votes et critères d'évaluation clinique sélectionnés par le testeur (exactitude, sécurité, complétude, etc.) ;</li>
      <li>les éventuels commentaires libres laissés par le testeur ;</li>
      <li>des données techniques (identifiant de session, adresse IP, horodatage) à des fins de sécurité et de mesure d'audience anonymisée.</li>
    </ul>
    <p>
      <strong>Important :</strong> les testeurs sont invités à ne saisir aucune
      donnée à caractère personnel concernant des patients réels (nom, date de
      naissance, identifiant de santé, contexte clinique permettant
      l'identification, etc.). Les prompts doivent rester anonymes ou
      fictionnels.
    </p>

    <h2 id="destinataires">Destinataires et sous-traitants</h2>
    <p>
      Pour générer les réponses comparées, les prompts saisis et les réponses
      produites sont transmis aux fournisseurs tiers des modèles de langage
      évalués, agissant en qualité de sous-traitants. Bayes Impact
      <strong>ne vend ni ne partage vos données avec des tiers à des fins
      commerciales ou marketing</strong>.
    </p>

    <h2 id="duree">Durée de conservation</h2>
    <p>
      Les données collectées sont conservées pendant une durée maximale de
      <strong>3 ans</strong> à compter de leur enregistrement. À l'issue de
      cette période, elles sont supprimées ou anonymisées de manière
      irréversible.
    </p>

    <h2 id="droits">Vos droits</h2>
    <p>Vous disposez à tout moment des droits suivants sur vos données :</p>
    <ul>
      <li><strong>Droit d'accès</strong> : connaître les données vous concernant traitées par Bayes Impact ;</li>
      <li><strong>Droit de rectification</strong> : demander la correction de données inexactes ;</li>
      <li><strong>Droit à l'effacement</strong> : demander la suppression de vos données ;</li>
      <li><strong>Droit à la limitation</strong> : demander la limitation du traitement de vos données ;</li>
      <li><strong>Droit à la portabilité</strong> : recevoir vos données dans un format structuré et lisible par machine ;</li>
      <li><strong>Droit d'opposition</strong> : vous opposer au traitement de vos données ;</li>
      <li><strong>Droit au retrait du consentement</strong> : à tout moment, sans justification.</li>
    </ul>

    <h2 id="dpo">Contact du Délégué à la protection des données</h2>
    <p>
      Pour exercer vos droits ou pour toute question relative au traitement
      de vos données, écrivez au DPO de Bayes Impact :
      <a href="mailto:dpo@bayesimpact.org">dpo@bayesimpact.org</a>
    </p>
    <p>
      Vous disposez également du droit d'introduire une réclamation auprès
      de la <abbr title="Commission Nationale de l'Informatique et des Libertés">CNIL</abbr>
      (<a href="https://www.cnil.fr" target="_blank" rel="noopener noreferrer">www.cnil.fr</a>).
    </p>

    <h2 id="securite">Sécurité</h2>
    <p>
      Les données sont stockées sur des serveurs situés en Union européenne,
      sous administration directe de Bayes Impact. Les accès sont restreints
      aux personnes habilitées.
    </p>
  </div>
</main>
