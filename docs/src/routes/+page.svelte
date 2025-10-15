<script lang="ts">
	import example1 from '$lib/hero/example1.svg';
	import example2 from '$lib/hero/example2.svg';
</script>

<svelte:head>
	<title>Zap – Your Typst Circuit Drawing Companion</title>
</svelte:head>

<div class="flex w-screen flex-col px-5 py-14 text-center md:min-h-screen md:py-20">
	<span class="text-new text-lg tracking-wide">Brand New Package</span>
	<span class="mx-auto mt-2 max-w-7xl text-5xl font-medium tracking-tight text-balance font-stretch-expanded sm:text-6xl md:text-8xl">
		Your Typst circuit drawing companion
	</span>
	<div class="mx-auto mt-8 flex items-center gap-3">
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
	<div class="mt-20 flex w-full flex-wrap items-stretch justify-center gap-8 px-5 text-left *:rounded-lg *:bg-white *:p-5 md:grid-cols-2 *:md:p-8">
		<img src={example1} class="order-2 max-w-full flex-auto md:max-w-max" alt="Example 1" />
		<img src={example2} class="order-1 max-w-full flex-auto md:max-w-max" alt="Example 2" />
	</div>
</div>
