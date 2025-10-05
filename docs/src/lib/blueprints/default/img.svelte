<script lang="ts">
    import type { Snippet } from 'svelte';

    let { src, alt }: { src: string, alt: string } = $props();

    let srcI = $derived(src.includes('$lib') ? import(src) : src)
</script>

<img src={await srcI} alt={alt} class="border rounded-lg bg-white" />