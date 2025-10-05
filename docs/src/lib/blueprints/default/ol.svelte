<script lang="ts">
    import type { Snippet } from 'svelte';

    let { children }: { children: Snippet } = $props();
</script>

<ol class="list-disc list-outside ms-5">
    {@render children()}
</ol>