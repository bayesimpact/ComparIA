import { redirect } from '@sveltejs/kit'

// Hidden during the compar:IA santé beta: feature not ready / off-scope for the
// medical context. Redirect deep links to the homepage instead of exposing stale
// or misleading content.
export function load() {
  redirect(307, '/')
}
