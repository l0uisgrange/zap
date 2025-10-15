<script lang="ts">
	import { createHighlighter, type Highlighter } from 'shiki';
	import { onMount } from 'svelte';
	import * as typstLang from './typst.tmLanguage.json';

	let { content, language = 'typst', dark = false } = $props();

	let highlighter: Highlighter | undefined = $state(undefined);
	let isDarkMode = $state(false);

	onMount(async () => {
		const darkModeQuery = window.matchMedia('(prefers-color-scheme: dark)');
		isDarkMode = darkModeQuery.matches;
		darkModeQuery.addEventListener('change', (event) => {
			isDarkMode = event.matches;
		});
		highlighter = await createHighlighter({
			themes: dark ? ['github-dark-default'] : ['github-light-default', 'github-dark-default'],
			langs: [typstLang as any, 'latex']
		});
	});

	const code = $derived.by(() => {
		if (!highlighter) return '';
		return highlighter.codeToHtml(content.toString(), {
			theme: isDarkMode || dark ? 'github-dark-default' : 'github-light-default',
			lang: language
		});
	});
</script>

<div class="group relative mb-2 grid w-full max-w-full rounded-lg border bg-neutral-100/30 px-4 py-3 antialiased dark:bg-neutral-900/30">
	<div class="max-w-full overflow-x-auto text-sm *:*:bg-transparent! *:bg-transparent!">
		{@html code}
	</div>
</div>
