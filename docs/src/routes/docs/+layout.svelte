<script lang="ts">
	import NavButton from '$lib/components/NavButton.svelte';
	import { page } from '$app/state';

	let { children } = $props();

	let menuopen = $state(false);
</script>

<button
	onclick={() => (menuopen = !menuopen)}
	class="dark:border-neutral-border flex w-full cursor-pointer items-center justify-between border-b border-neutral-200 px-5 py-2.5 md:hidden"
>
	Menu
	<span class="icon-[hugeicons--arrow-down-01] size-6 transition {menuopen && 'rotate-180'}"></span>
</button>
<div class="relative md:flex">
	<div
		class="dark:border-neutral-border {!menuopen &&
			'hidden'} top-32 left-0 flex-none space-y-1 border-r-0 border-b border-neutral-200 p-5 font-medium md:sticky md:block md:min-h-full md:w-72 md:border-r md:border-b-0"
	>
		<NavButton href="/docs" active={page.url.pathname === '/docs'}>Get started</NavButton>
		<NavButton href="/docs/basics" active={page.url.pathname === '/docs/basics'}>Basics</NavButton>
		<NavButton href="/docs/positioning" active={page.url.pathname === '/docs/positioning'}>Positioning</NavButton>
		<NavButton href="/docs/standards" active={page.url.pathname === '/docs/standards'}>Standards</NavButton>
		<NavButton href="/docs/decorations" active={page.url.pathname === '/docs/decorations'}>Decorations</NavButton>
		<NavButton href="/docs/styling" active={page.url.pathname === '/docs/styling'}>Styling</NavButton>
		<div class="h-6"></div>
		<NavButton href="/docs/components" active={page.url.pathname.startsWith('/docs/components')}>Components</NavButton>
		<NavButton href="/docs/custom" newFeature active={page.url.pathname.startsWith('/docs/custom')}>Custom components</NavButton>
	</div>
	<article class="flex-auto">
		{@render children()}
	</article>
</div>
