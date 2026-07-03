<script lang="ts">
  import { page } from '$app/state'
  import { m } from '$lib/i18n/messages'

  // Bayes Impact — beta santé: /datasets, /news and /product (now just the FAQ,
  // reachable from the homepage) are hidden for now. See the corresponding
  // +page.server.ts redirects.
  const navLinks = [
    { href: '/', label: m['seo.titles.home']() },
    { href: '/ranking', label: m['seo.titles.ranking']() },
    { href: '/modeles', label: m['seo.titles.modeles']() }
  ]

  function isCurrentPage(path: string, href: string) {
    if (path.includes('product')) return href.includes('product')
    return path === href
  }
</script>

<nav class="fr-nav" data-fr-js-navigation="true">
  <ul class="fr-nav__list fr-container">
    {#each navLinks as link (link.href)}
      <li class="fr-nav__item" data-fr-js-navigation-item="true">
        <a
          href={link.href}
          target="_self"
          aria-controls="modal-header__menu"
          class="fr-nav__link"
          aria-current={isCurrentPage(page.url.pathname, link.href) ? 'true' : undefined}
          data-fr-js-modal-button="true"
        >
          {link.label}
        </a>
      </li>
    {/each}
  </ul>
</nav>
