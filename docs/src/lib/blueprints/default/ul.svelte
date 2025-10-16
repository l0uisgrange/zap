<script lang="ts">
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } = $props();
</script>

<ul class="ms-5 list-outside list-disc space-y-1.5">
	{@render children()}
</ul>
