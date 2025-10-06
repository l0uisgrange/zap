<script lang="ts">
    import type { Snippet } from 'svelte';

    let { children }: { children: Snippet } = $props();
</script>

<code class="text-xs antialiased *:bg-neutral-950">{@render children()}</code>