<script lang="ts">
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } = $props();
</script>

<span
	class="group relative mt-4 mb-3 block w-full max-w-full overflow-x-scroll rounded-lg border bg-neutral-100/30 px-5 py-4 text-sm antialiased *:*:max-w-full *:max-w-92 *:scroll-mr-5 *:*:overflow-hidden *:*:bg-transparent! *:bg-transparent! dark:bg-neutral-900/30"
>
	{@render children()}
</span>
