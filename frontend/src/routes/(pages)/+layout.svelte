<script lang="ts">
  import { page } from '$app/state'
  import Footer from '$components/Footer.svelte'
  import { Header, VoteGauge } from '$components/header'
  import { m } from '$lib/i18n/messages'

  let { children } = $props()

  const isHome = $derived(page.url.pathname === '/')
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

<Footer />
