<script lang="ts">
    import type { Snippet } from 'svelte';

    let { children }: { children: Snippet } = $props();
</script>

<pre class="group relative grid w-full max-w-full rounded-xl bg-neutral-100 px-4 py-3 antialiased ring-1 ring-gray-200 ring-offset-2 ring-offset-neutral-100 ring-inset dark:bg-neutral-800 dark:ring-gray-800 dark:ring-offset-neutral-800 mb-3">{@render children()}</pre>