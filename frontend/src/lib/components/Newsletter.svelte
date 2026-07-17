<script lang="ts">
  import { Button, Checkbox, Icon, Link } from '$components/dsfr'
  import { api } from '$lib/fastapi-client'

  let email = $state('')
  let honeypot = $state('')
  let consent = $state(false)
  let status = $state<'idle' | 'loading' | 'subscribed' | 'already_subscribed' | 'error'>('idle')

  async function subscribe(event: SubmitEvent) {
    event.preventDefault()
    // Hidden field: real users leave it empty, most spam bots fill every field.
    if (honeypot || !consent) return

    status = 'loading'
    try {
      const result = await api.request<{ status: 'subscribed' | 'already_subscribed' }>(
        '/newsletter/subscribe',
        {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ email, website_url: honeypot })
        }
      )
      status = result.status
    } catch {
      status = 'error'
    }
  }
</script>

<div class="mt-3 text-center">
  <div class="bg-light-info p-3 inline-block">
    <Link href="#" text="Haut de page" icon="arrow-up-line" class="pb-1!" />
  </div>
</div>
<section class="fr-container--fluid bg-light-info">
  <div class="fr-container pb-10 pt-8">
    <div class="mb-4">
      <h5 class="mb-2! flex items-center">
        <Icon icon="i-ri-mail-line" size="lg" block class="text-primary me-2" />
        Abonnez-vous à notre lettre d'information
      </h5>
      <p class="text-sm!">
        Retrouvez les dernières actualités du projet : partenariats, intégration de nouveaux
        modèles, publications de jeux de données et nouvelles fonctionnalités !
      </p>
    </div>
    {#if status === 'subscribed' || status === 'already_subscribed'}
      <p class="text-sm! font-bold">
        {status === 'already_subscribed'
          ? 'Vous êtes déjà abonné·e à notre lettre d’information.'
          : 'Merci ! Votre inscription est confirmée.'}
      </p>
    {:else}
      <form onsubmit={subscribe}>
        <div class="flex flex-wrap items-start gap-2">
          <label for="newsletter-email" class="sr-only">Adresse e-mail</label>
          <input
            bind:value={honeypot}
            type="text"
            name="website_url"
            tabindex="-1"
            autocomplete="off"
            aria-hidden="true"
            class="sr-only"
          />
          <input
            bind:value={email}
            id="newsletter-email"
            type="email"
            required
            placeholder="prenom.nom@email.fr"
            class="fr-input grow min-w-[16rem]"
          />
          <Button text="M’abonner" type="submit" disabled={status === 'loading' || !consent} />
        </div>
        <Checkbox
          id="newsletter-consent"
          bind:checked={consent}
          class="mt-2!"
          label="J’accepte de recevoir la lettre d’information et j’ai lu la <a href='/donnees-personnelles'>politique de confidentialité</a>."
        />
      </form>
      {#if status === 'error'}
        <p class="text-sm! text-error mt-2">Une erreur est survenue, veuillez réessayer.</p>
      {/if}
    {/if}
  </div>
</section>
