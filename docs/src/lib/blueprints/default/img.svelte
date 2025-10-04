<script lang="ts">
    import type { Snippet } from 'svelte';

    let { src, alt }: { src: string, alt: string } = $props();
</script>

<img src={src} alt={alt} class="border rounded-lg bg-white" />