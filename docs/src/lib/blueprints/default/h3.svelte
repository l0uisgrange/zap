<script lang="ts">
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } = $props();
</script>

<h3 class="mt-5 scroll-mt-24">{@render children()}</h3>
