<script lang="ts">
	import '../app.css';
	import github from '$lib/github-mark.svg';
	import typst from '$lib/typst.svg';
	import typstlight from '$lib/typst-light.svg';
	import githublight from '$lib/github-light.svg';
	import Avatar from "./docs/components/[id]/Avatar.svelte";

	let { children } = $props();
</script>

<div class="dark:gray-dark dark:border-neutral-border sticky top-0 left-0 z-10 border-b border-neutral-200 bg-white py-3 dark:bg-neutral-900">
	<div class="mx-auto flex items-center justify-between gap-5 px-5 py-2.5">
		<a href="/" class="flex items-center gap-2 text-lg font-medium italic font-stretch-110%">Zap</a>
		<a href="/docs" class="ml-auto hidden md:block hover:underline underline-offset-3">Documentation</a>
		<a href="/examples" class="hidden md:block hover:underline underline-offset-3">Examples</a>
        <a target="_blank" href="https://github.com/l0uisgrange/zap/releases" class="hidden md:block hover:underline underline-offset-3">Changelog</a>
		<a target="_blank" href="https://github.com/l0uisgrange/zap/discussions/categories/q-a" class="hidden md:block hover:underline underline-offset-3">
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
<div class="dark:border-neutral-border flex flex-col border-t border-neutral-200 px-5 py-5 md:flex-row md:items-center md:justify-between">
	<span class="flex items-center gap-2">A project initiated by <Avatar username="l0uisgrange" displayUsername /></span>
	<span class="text-gray-500">Project under LGPL-3.0 license</span>
</div>
