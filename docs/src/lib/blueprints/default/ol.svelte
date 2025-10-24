<script lang="ts">
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } = $props();
</script>

<ol class="ms-5 list-outside list-decimal space-y-1.5">
	{@render children()}
</ol>
