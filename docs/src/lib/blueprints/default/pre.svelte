<script lang="ts">
	import type { Snippet } from 'svelte';
	import { createHighlighter } from 'shiki';

	let { children }: { children: Snippet } = $props();
</script>

<pre
	class="group relative mb-3 grid w-full max-w-full rounded-xl bg-neutral-100 px-4 py-3 text-sm antialiased ring-1 ring-gray-200 ring-offset-2 ring-offset-neutral-100 ring-inset dark:bg-neutral-900 dark:ring-neutral-700 dark:ring-offset-neutral-900">
    {@render children()}
</pre>