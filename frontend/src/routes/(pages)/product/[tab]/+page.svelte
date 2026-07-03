<script lang="ts">
  import SeoHead from '$components/SEOHead.svelte'
  import { Tabs } from '$components/dsfr'
  import { m } from '$lib/i18n/messages'
  import { getLocale } from '$lib/i18n/runtime'
  import { FAQ } from './components'

  const { data } = $props()
  const locale = getLocale()
  const isFr = $derived(['fr', 'en'].includes(locale))

  const tabs = ([{ id: 'faq' }] as const).map((tab) => ({
    ...tab,
    href: `/product/${tab.id}`,
    label: m[`product.${tab.id}.tabLabel`]()
  }))
</script>

<SeoHead title={m[`seo.titles.${data.tab}`]()} />

<main class={['bg-light-grey pt-12 pb-30', isFr ? 'next' : 'prev']}>
  <div class="fr-container">
    <h1 class="fr-h3 mb-10!">{m['product.title']()}</h1>

    <Tabs
      {tabs}
      initialId={data.tab}
      label={m['product.title']()}
      panelClass="bg-white px-4! md:p-10!"
    >
      {#snippet tab({ id })}
        {#if id === 'faq'}
          <FAQ />
        {/if}
      {/snippet}
    </Tabs>
  </div>
</main>
