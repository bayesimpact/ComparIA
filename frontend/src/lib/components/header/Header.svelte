<script lang="ts">
  import { page } from '$app/state'
  import { Button, Link } from '$components/dsfr'
  import { m } from '$lib/i18n/messages'
  import { LanguageSelector, Menubar, VoteGauge } from '.'

  let {
    hideNavigation = false,
    hideLanguageSelector = false,
    hideVoteGauge = false,
    hideDiscussBtn = false,
    showHelpLink = false,
    small
  }: {
    hideNavigation?: boolean
    hideLanguageSelector?: boolean
    hideVoteGauge?: boolean
    hideDiscussBtn?: boolean
    showHelpLink?: boolean
    small?: boolean
  } = $props()
</script>

{#snippet helpLink()}
  <Link
    href="https://adtk8x51mbw.eu.typeform.com/to/duuGRyEX"
    text={m['header.help.link.content']()}
    title={m['header.help.link.title']()}
    icon="pencil-line"
    button
    variant="tertiary-no-outline"
    size="sm"
    native
    hideExternalIcon
  />
{/snippet}

<header id="main-header" class="fr-header lg:overflow-visible overflow-hidden">
  <div class="fr-header__body">
    <div class="fr-container">
      <div class={['fr-header__body-row', { 'lg:py-1!': small }]}>
        <div
          class={['fr-header__brand fr-enlarge-link', { 'lg:-translate-x-1/8 lg:scale-75': small }]}
        >
          <div class="fr-header__brand-top w-auto!">
            <div class="fr-header__logo">
              <!-- Bayes Impact: DSFR République Française mark removed;
                   the bi-colors logo below is the only branding for this deploy. -->
            </div>
          </div>
          <div
            class="fr-header__service mx-1! sm:mx-3! md:px-3! flex w-auto grow items-center before:content-none!"
          >
            <div class="me-4 sm:block hidden overflow-hidden shrink-0" style="height: 36px; width: auto;">
              <img
                src="/orgs/bi-colors.svg"
                aria-hidden="true"
                alt=""
                style="height: 36px; width: auto;"
              />
            </div>
            <div>
              <p class="fr-header__service-title mb-0! leading-normal! flex items-center gap-2">
                <a
                  href="/"
                  target={page.url.pathname.includes('arene') ? '_blank' : undefined}
                  title={m['header.homeTitle']()}
                >
                  {m['header.title']()}
                </a>
                <span
                  class="text-primary border-primary rounded border px-1.5 py-0.5 text-[10px]! font-bold uppercase leading-none tracking-wide"
                >
                  Bêta
                </span>
              </p>

              <p
                class="fr-header__service-tagline mb-0! leading-normal! text-dark-grey md:text-[14px]! text-[10px]!"
              >
                {m['header.subtitle']()}
              </p>
            </div>
          </div>
          <div class="fr-header__navbar mt-0! self-auto!">
            <button
              class="fr-btn fr-btn--menu -ms-1! me-3!"
              data-fr-opened="false"
              aria-controls="fr-modal-menu"
              aria-haspopup="menu"
              title={m['header.menu']()}
            >
              {m['header.menu']()}
            </button>
          </div>
        </div>

        <div class="gap-3 p-4 lg:flex ms-auto hidden items-center">
          {#if !hideVoteGauge}
            <VoteGauge id="vote-gauge" />
          {/if}

          {#if showHelpLink}
            {@render helpLink()}
          {/if}

          {#if !hideLanguageSelector}
            <LanguageSelector id="translate" />
          {/if}

          {#if !hideDiscussBtn}
            <Link
              button
              href="/arene"
              text={m['header.startDiscussion']()}
              class="whitespace-nowrap"
            />
          {/if}
        </div>
      </div>
    </div>
  </div>

  <dialog
    aria-labelledby="fr-modal-title-modal-menu"
    id="fr-modal-menu"
    class="fr-modal fr-header__menu"
  >
    <div class="fr-container lg:p-0!">
      <Button
        variant="tertiary-no-outline"
        text={m['words.close']()}
        title={m['closeModal']()}
        aria-controls="fr-modal-menu"
        class="fr-btn--close"
      />

      <div class="fr-header__menu-links after:mt-4! lg:hidden">
        {#if showHelpLink}
          {@render helpLink()}
        {/if}

        {#if !hideLanguageSelector}
          <LanguageSelector id="mobile-translate" />
        {/if}
      </div>

      {#if !hideNavigation}
        <Menubar />
      {/if}

      {#if !hideDiscussBtn}
        <div class="mt-6! md:mt-0 lg:hidden">
          <Link
            button
            href="/arene"
            text={m['header.startDiscussion']()}
            class="w-full! whitespace-nowrap"
          />
        </div>
      {/if}
    </div>
  </dialog>
</header>
