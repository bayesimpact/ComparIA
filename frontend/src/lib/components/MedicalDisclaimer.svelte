<script lang="ts">
  import { Icon } from '$components/dsfr'
  import { m } from '$lib/i18n/messages'

  // banner: strong full-width notice (top of arène / pages)
  // inline: compact reminder (homepage CTA, model reveal, etc.)
  // vote:   compact reminder shown while judging answers
  let { kind = 'banner' }: { kind?: 'banner' | 'inline' | 'vote' } = $props()
</script>

{#if kind === 'banner'}
  <div class="cl-med-disclaimer fr-container--fluid bg-[--cg-orange]/12 border-t-3 border-orange py-3">
    <div class="fr-container flex items-start gap-3">
      <Icon icon="i-ri-error-warning-line" class="text-orange text-[22px] shrink-0 mt-0.5" />
      <p class="mb-0! text-sm! leading-snug!">
        <strong>{m['sante.disclaimer.title']()}.</strong>
        {m['sante.disclaimer.banner']()}
        <strong class="text-orange">{m['sante.disclaimer.noPatientData']()}</strong>
      </p>
    </div>
  </div>
{:else}
  <p
    class="flex items-start gap-2 text-sm! leading-snug! text-dark-grey mb-0! mt-3! px-3 py-2 bg-[--cg-orange]/10 rounded-lg"
  >
    <Icon icon="i-ri-error-warning-line" class="text-orange text-[18px] shrink-0 mt-0.5" />
    <span>{kind === 'vote' ? m['sante.disclaimer.vote']() : m['sante.disclaimer.short']()}</span>
  </p>
{/if}
