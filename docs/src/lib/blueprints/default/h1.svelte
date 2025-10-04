<script lang="ts">
    import type { Snippet } from 'svelte';

    let { children }: { children: Snippet } = $props();
</script>

<h1 class="scroll-mt-24">{@render children()}</h1>