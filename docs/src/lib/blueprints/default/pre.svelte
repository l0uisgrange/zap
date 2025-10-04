<script lang="ts">
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } = $props();
</script>

<span
	class="group relative *:max-w-92 *:scroll-mr-5 *:*:max-w-full *:*:overflow-hidden overflow-x-scroll border *:*:bg-transparent! *:bg-transparent! mb-3 w-full max-w-full mt-4 block rounded-lg bg-neutral-100/30 px-5 py-4 text-sm antialiased dark:bg-neutral-900/30">
    {@render children()}
</span>