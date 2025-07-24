<script lang="ts">
	import { createHighlighter } from 'shiki';
	import { ShikiMagicMove } from 'shiki-magic-move/svelte';
	import * as typstLang from '$lib/components/typst.tmLanguage.json';

	import 'shiki-magic-move/dist/style.css';
	import { onMount } from 'svelte';

	let { code } = $props();

	const highlighter = createHighlighter({
		themes: ['github-dark-default', 'github-light-default'],
		langs: [typstLang as any]
	});

	let isDarkMode = $state(false);

	onMount(async () => {
		const darkModeQuery = window.matchMedia('(prefers-color-scheme: dark)');
		isDarkMode = darkModeQuery.matches;
		darkModeQuery.addEventListener('change', (event) => {
			isDarkMode = event.matches;
		});
	});
</script>

<div
	class="mb-2 block w-full max-w-full overflow-x-auto rounded-xl bg-neutral-100 px-4 py-3 text-base text-[15px] ring-1 ring-gray-200 ring-offset-2 ring-offset-neutral-100 ring-inset dark:bg-neutral-800 dark:ring-gray-800 dark:ring-offset-neutral-800"
>
	{#await highlighter then highlighter}
		<ShikiMagicMove
			lang="typst"
			theme={isDarkMode ? 'github-dark-default' : 'github-light-default'}
			{highlighter}
			{code}
			options={{ duration: 100, stagger: 0.1 }}
		/>
	{/await}
</div>
