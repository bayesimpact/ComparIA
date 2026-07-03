<script lang="ts">
  import { onMount } from 'svelte'
  import { page } from '$app/state'
  import { Icon } from '$components/dsfr'
  import Footer from '$components/Footer.svelte'
  import { Header, VoteGauge } from '$components/header'
  import { m } from '$lib/i18n/messages'
  import { getLocale } from '$lib/i18n/runtime'

  let { children } = $props()

  const isHome = $derived(page.url.pathname === '/')
  const isFr = getLocale() === 'fr'

  onMount(() => {
    if (isFr) {
      const script = document.createElement('script')
      script.src = 'https://tally.so/widgets/embed.js'
      script.async = true
      document.head.appendChild(script)
      return () => script.remove()
    }
  })
</script>

<Header hideDiscussBtn={isHome} />

{#if isHome}
  <div class="fr-container--fluid bg-primary px-4 py-2 text-center">
    <p class="mb-0! text-sm! font-medium text-white!">{m['sante.beta']()}</p>
  </div>
{/if}

<div
  class="fr-container--fluid bg-light-grey lg:hidden flex h-[48px] items-center justify-center drop-shadow-[--raised-shadow]"
>
  <VoteGauge id="mobile-vote-gauge" />
</div>

{@render children()}

{#if isFr}
  <button
    data-tally-open="1AVpXL"
    data-tally-hide-title="1"
    data-tally-auto-close="5000"
    class="fixed bottom-6 right-6 z-50 flex items-center gap-2 rounded-full bg-[#2E8A5A]! hover:bg-[#277A4F]! px-4 py-3 text-white! shadow-lg cursor-pointer"
    aria-label="Donner votre avis"
  >
    <Icon icon="i-ri-feedback-line" class="text-white" />
    <span class="text-sm font-medium">Votre avis</span>
  </button>
{/if}

<Footer />
