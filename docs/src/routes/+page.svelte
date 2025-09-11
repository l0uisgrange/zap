<script lang="ts">
	import example1 from '$lib/hero/example1.svg';
	import example2 from '$lib/hero/example2.svg';
</script>

<svelte:head>
	<title>Zap – Your Typst Circuit Drawing Companion</title>
</svelte:head>

<div class="flex w-screen flex-col px-5 text-center py-14 md:min-h-screen md:py-20">
	<span class="text-new text-lg tracking-wide">Brand New Package</span>
	<span class="mt-2 max-w-7xl mx-auto text-5xl sm:text-6xl font-medium text-balance tracking-tight font-stretch-expanded md:text-8xl">
		Your Typst circuit drawing companion
	</span>
	<div class="mt-8 flex items-center gap-3 mx-auto">
		<a
			href="/docs"
			class="flex items-center gap-2 rounded-full bg-neutral-900 px-5 py-2 text-white transition hover:bg-neutral-900/90 dark:bg-white dark:text-black dark:hover:bg-white/90"
		>
			<span class="icon-[hugeicons--book-open-02] size-5.5"></span> Documentation
		</a>
		<a
			href="/examples"
			class="rounded-full bg-gray-500 px-5 py-2 text-white transition hover:bg-gray-500/90 dark:bg-gray-600 dark:hover:bg-gray-600/90"
		>
			Examples
		</a>
	</div>
	<div class="mt-20 flex flex-wrap px-5 w-full justify-center items-stretch gap-8 text-left md:grid-cols-2">
		<img src={example1} class="flex-auto max-w-max order-2" alt="Example 1" />
		<img src={example2} class="flex-auto max-w-max order-1" alt="Example 2" />
	</div>
</div>
