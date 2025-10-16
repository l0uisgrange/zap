<script lang="ts">
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } = $props();
</script>

<ol class="ms-5 list-outside list-disc">
	{@render children()}
</ol>
