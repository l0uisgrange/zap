<script lang="ts">
	import type { Snippet } from 'svelte';
	import type { HTMLAttributes } from 'svelte/elements';

	let { src, alt, ...rest }: { src: string; alt: string } & HTMLAttributes<HTMLImageElement> = $props();
</script>

<img {src} {alt} class="rounded-lg border bg-white {rest.class}" />
