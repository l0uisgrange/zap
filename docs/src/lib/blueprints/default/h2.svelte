<script lang="ts">
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } & any = $props();

	let h2Element: HTMLHeadingElement | null = $state(null);
	let href = $derived(h2Element?.id ? `#${h2Element.id}` : '#');
</script>

<a {href} class="group flex items-center gap-2">
	<h2 bind:this={h2Element} class="scroll-mt-24">{@render children()}</h2>
	<span class="icon-[hugeicons--link-04] -mb-2 hidden size-6 opacity-50 group-hover:block"></span>
</a>
