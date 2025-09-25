h3.svelte<script lang="ts">
    import type { Snippet } from 'svelte';

    let { children }: { children: Snippet } = $props();
</script>

<ol>
    {@render children()}
</li>