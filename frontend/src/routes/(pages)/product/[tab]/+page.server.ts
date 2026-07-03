import { error } from '@sveltejs/kit'

export function load({ params }) {
  // compar:IA santé beta: the parent-project tabs (comparator, community,
  // history, partners) and the "problem" manifesto (about European linguistic
  // diversity, off-scope for health) are hidden; only the FAQ remains.
  const TABS = ['faq'] as const
  type TabsId = (typeof TABS)[number]

  if (!TABS.includes(params.tab as TabsId)) {
    error(404)
  }

  return {
    tab: params.tab as TabsId
  }
}
