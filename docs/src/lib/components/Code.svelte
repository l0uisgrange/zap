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

	let copied = $state(false);

	function copy() {
		navigator.clipboard.writeText(content.toString());
		copied = true;
		setTimeout(() => (copied = false), 2000);
	}
</script>

<div
	class="group relative mb-2 grid w-full max-w-full rounded-xl px-4 py-3 antialiased border bg-neutral-100/30 *:*:bg-none *:bg-none dark:bg-neutral-900/30"
>
	<button
		class="absolute top-3 right-3 ml-auto flex max-w-max scale-0 cursor-pointer items-center gap-1.5 rounded-full bg-gray-900 px-2 py-1 text-xs font-medium text-white transition duration-100 group-hover:scale-100 hover:bg-gray-800"
		onclick={copy}
	>
		{#if !copied}
			Copy
		{:else}
			Copied
		{/if}
	</button>
	<div class="max-w-full text-sm overflow-x-auto">
		{@html code}
	</div>
</div>
