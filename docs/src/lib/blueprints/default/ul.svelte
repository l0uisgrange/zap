<script lang="ts">
    import type { Snippet } from 'svelte';

    let { children }: { children: Snippet } = $props();
</script>

<ul class="list-disc list-outside ms-5 space-y-1.5">
    {@render children()}
</ul>