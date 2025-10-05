<script lang="ts">
	import NavButton from '$lib/components/NavButton.svelte';
	import { page } from '$app/state';

	let { children } = $props();

	let menuopen = $state(false);
</script>

<button
	onclick={() => (menuopen = !menuopen)}
	class="flex w-full cursor-pointer items-center justify-between border-b px-5 py-2.5 md:hidden"
>
	Menu
	<span class="icon-[hugeicons--arrow-down-01] size-6 transition {menuopen && 'rotate-180'}"></span>
</button>
<div class="relative md:flex h-full">
    <div class="{!menuopen &&
                'hidden'} md:block flex-none space-y-1 border-r-0 border-b p-5 md:w-72 md:border-r md:border-b-0">
        <div
            class="md:sticky top-24"
        >
            <NavButton href="/docs" active={page.url.pathname === '/docs'}>
                <span class="flex items-center gap-2">
                    <span class="icon-[hugeicons--package] size-5"></span>
                    Introduction
                </span>
            </NavButton>
            <NavButton href="/docs/get-started" active={page.url.pathname === '/docs/get-started'}>
                <span class="flex items-center gap-2">
                    <span class="icon-[hugeicons--drawing-compass] size-5"></span>
                    Get started
                </span>
            </NavButton>
            <div class="h-6"></div>

            <NavButton href="/docs/positioning" active={page.url.pathname === '/docs/positioning'}>Positioning</NavButton>
            <NavButton href="/docs/decorations" active={page.url.pathname === '/docs/decorations'} newFeature>Labels & decorations</NavButton>
            <NavButton href="/docs/styling" active={page.url.pathname === '/docs/styling'}>Styling</NavButton>
            <NavButton href="/docs/wiring" active={page.url.pathname === '/docs/wiring'} newFeature>Wiring</NavButton>
            <div class="h-6"></div>
            <NavButton href="/docs/integrated" active={page.url.pathname === '/docs/integrated'} newFeature>Integrated circuits</NavButton>
            <NavButton href="/docs/symbols" active={page.url.pathname.startsWith('/docs/symbols')}>Symbols</NavButton>
            <NavButton href="/docs/custom" active={page.url.pathname.startsWith('/docs/custom')}>Custom symbol</NavButton>
            <div class="h-6"></div>
            <NavButton href="/docs/debug" active={page.url.pathname === '/docs/debug'}>Debugging</NavButton>
        </div>
    </div>
	<article class="flex-auto">
		{@render children()}
	</article>
</div>
