<script lang="ts">
    import type { Snippet } from 'svelte';

    let { children }: { children: Snippet } = $props();
</script>

<h2>{@render children()}</h2>