<script lang="ts">
  import ThemeSelector from '$components/ThemeSelector.svelte'
  import { m } from '$lib/i18n/messages'
  import { externalLinkProps, sanitize } from '$lib/utils/commons'

  const links = (
    [
      { href: '/mentions-legales', labelKey: 'legal' },
      { href: '/modalites', labelKey: 'tos' },
      { href: '/donnees-personnelles', labelKey: 'privacy' },
      { href: '/accessibilite', labelKey: 'accessibility' },
      { href: '/ecoconception', labelKey: 'rgesn' },
      { href: 'https://github.com/bayesimpact/ComparIA', labelKey: 'sources' }
    ] as const
  ).map(({ href, labelKey }) => {
    return {
      href,
      label: m[`footer.links.${labelKey}`](),
      target: href.startsWith('http') ? '_blank' : undefined,
      rel: href.startsWith('http') ? 'noopener external' : undefined
    }
  })
</script>

<footer class="fr-footer fr-pb-2w" id="main-footer">
  <div class="fr-container">
    <div class="fr-footer__body">
      <div class="gap-8 lg:basis-1/2 flex flex-wrap">
        <div class="fr-footer__brand fr-enlarge-link">
          <div class="">
            <a href="/" title={m['footer.backHome']()}>
              <img src="/orgs/bi-colors.svg" alt={m['header.logoAlt']()} class="max-h-[70px]" />
            </a>
          </div>
        </div>

        <div class="fr-footer__brand fr-enlarge-link gap-3 max-w-[165px] flex-col! items-start!">
          <a
            href="https://www.digitalpublicgoods.net/r/comparia"
            target="_blank"
            class="after:content-none!"
          >
            <img src="/orgs/dpg.png" alt="DPG" class="max-h-[47px]" />
          </a>
          <p class="mb-0! leading-normal! text-[11px]!">{m['footer.dpg']()}</p>
        </div>
      </div>
    </div>
    <div class="fr-footer__bottom">
      <ul class="fr-footer__bottom-list">
        {#each links as { label, ...props } (props.href)}
          <li class="fr-footer__bottom-item">
            <a class="fr-footer__bottom-link" {...props}>{label}</a>
          </li>
        {/each}
        <li class="fr-footer__bottom-item">
          <ThemeSelector />
        </li>
      </ul>
      <div class="fr-footer__bottom-copy">
        <p>
          {@html sanitize(
            m['footer.license.mention']({
              linkProps: externalLinkProps({
                href: 'https://github.com/etalab/licence-ouverte/blob/master/LO.md',
                title: m['footer.license.linkTitle']()
              })
            })
          )}
        </p>
      </div>
    </div>
  </div>
</footer>
