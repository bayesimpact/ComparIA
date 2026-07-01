import { dev } from '$app/environment'
import { env } from '$env/dynamic/public'
import { getLocale, type Locale } from '$lib/i18n/runtime'
import { getContext, setContext } from 'svelte'

const disabledLocaleCodes = env.PUBLIC_DISABLED_LOCALES
  ? env.PUBLIC_DISABLED_LOCALES.split(',').map((code) => code.trim())
  : null

export type LocaleOption = { code: Locale; short: string; long: string; host: string }

const DEFAULT_HOST = dev ? 'localhost:5173' : 'comparia.beta.gouv.fr'
export const HOST_TO_LOCALE = dev
  ? {
      '127.0.0.1:8080': 'da'
    }
  : {
      'ai-arenaen.dk': 'da',
      'aiarenaen.dk': 'da'
    }
// Bayes Impact / Impulse Healthtech: deploy is restricted to fr/en. The
// other upstream locales (da/lt/sv) are removed so the language selector
// never offers them. Keep in sync with `locales` in comparia.inlang/settings.json.
const ALL_LOCALES = [
  { code: 'fr', short: 'FR', long: 'FR - Français', host: DEFAULT_HOST }
] satisfies LocaleOption[]

export const LOCALES = ALL_LOCALES.filter((locale) => {
  return !disabledLocaleCodes?.includes(locale.code)
})

export type VotesData = { count: number; objective: number }

export function setVotesContext(votes: VotesData) {
  setContext('votes', votes)
}

export function getVotesContext() {
  return getContext<VotesData>('votes')
}

export type I18nData = {
  contact: string
  peopleUsingAIDataLink: string
}

export function setI18nContext() {
  const i18nData: Record<string, I18nData> = {
    da: {
      contact: 'kontakt@ai-arenaen.dk',
      peopleUsingAIDataLink:
        'https://ec.europa.eu/eurostat/fr/web/products-eurostat-news/w/ddn-20251216-3'
    },
    fr: {
      contact: 'contact@comparia.beta.gouv.fr',
      peopleUsingAIDataLink:
        'https://www.credoc.fr/publications/barometre-du-numerique-2026-rapport'
    }
  } as const
  const locale = (getLocale() as string) === 'da' ? 'da' : 'fr'
  setContext('i18n', i18nData[locale])
}

export function getI18nContext() {
  return getContext<I18nData>('i18n')
}
