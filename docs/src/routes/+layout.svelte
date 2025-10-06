<script lang="ts">
	import '../app.css';
	import github from '$lib/github-mark.svg';
	import typst from '$lib/typst.svg';
	import typstlight from '$lib/typst-light.svg';
	import githublight from '$lib/github-light.svg';
	import Avatar from './docs/symbols/[id]/Avatar.svelte';

	let { children } = $props();
</script>

<div class="sticky top-0 left-0 z-10 border-b bg-white py-3 dark:bg-black">
	<div class="mx-auto flex items-center justify-between gap-5 px-5 py-2.5">
		<a href="/" class="flex items-center gap-2 text-lg font-medium italic font-stretch-110%">Zap</a>
		<a href="/docs" class="ml-auto hidden underline-offset-3 hover:underline md:block">Documentation</a>
		<a href="/examples" class="hidden underline-offset-3 hover:underline md:block">Examples</a>
		<a target="_blank" href="https://github.com/l0uisgrange/zap/releases" class="hidden underline-offset-3 hover:underline md:block">Changelog</a>
		<a
			target="_blank"
			href="https://github.com/l0uisgrange/zap/discussions/categories/q-a"
			class="hidden underline-offset-3 hover:underline md:block"
		>
			Forum
		</a>
		<a class="mt-1.5 ml-auto opacity-50 transition hover:opacity-75 md:ml-5" href="https://typst.app/universe/package/zap" target="_blank">
			<img src={typst} alt="typst" class="h-5 dark:hidden" />
			<img src={typstlight} alt="typst" class="hidden h-5 dark:block" />
		</a>
		<a class="opacity-50 transition hover:opacity-75" href="https://github.com/l0uisgrange/zap" target="_blank">
			<img src={github} alt="github" class="size-7 dark:hidden" />
			<img src={githublight} alt="github" class="hidden size-7 dark:block" />
		</a>
	</div>
</div>
{@render children()}
<div class="flex flex-col border-t px-5 py-5 md:flex-row md:items-center md:justify-between">
	<span class="flex items-center gap-2">A project initiated by <Avatar username="l0uisgrange" displayUsername /></span>
	<span class="text-gray-500">Project under LGPL-3.0 license</span>
</div>
