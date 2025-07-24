<script lang="ts">
	let { children } = $props();
</script>

<article class="flex-auto">
	{@render children()}
</article>
