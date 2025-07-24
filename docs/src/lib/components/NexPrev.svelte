<script lang="ts">
	let { previous = null, next = null } = $props();
</script>

<div class="mt-14 ml-auto flex items-center justify-between">
	{#if previous}
		<a href={previous.href} class="group flex items-center gap-2 decoration-0">
			<span
				class="icon-[hugeicons--arrow-left-02] size-6 text-gray-600 transition group-hover:-translate-x-3 dark:text-gray-500"
			></span>
			<span class="text-black decoration-0 dark:text-white">{previous.title}</span>
			<span class="text-gray-400 decoration-0">Previous</span>
		</a>
	{/if}
	{#if next}
		<a href={next.href} class="group ml-auto flex items-center gap-2 decoration-0">
			<span class="text-gray-400 decoration-0">Next</span>
			<span class="text-black decoration-0 dark:text-white">{next.title}</span>
			<span
				class="icon-[hugeicons--arrow-right-02] size-6 text-gray-600 transition group-hover:translate-x-3 dark:text-gray-500"
			></span>
		</a>
	{/if}
</div>
