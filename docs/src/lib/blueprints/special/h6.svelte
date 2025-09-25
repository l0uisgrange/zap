h3.svelte<script lang="ts">
    import type { Snippet } from 'svelte';

    let { children }: { children: Snippet } = $props();
</script>

<h1 class="mb-6 border-b-2 border-gray-200 pb-2 text-4xl font-bold text-gray-900">
    {@render children()}
</h1>