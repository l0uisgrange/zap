<script lang="ts">
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import Code from '$lib/components/Code.svelte';
	import Type from '$lib/components/Type.svelte';
	import { version } from '$lib';

	let headings: any[] = $state([]);

	onMount(() => {
		const headingElements = document.querySelectorAll('h1, h2, h3');
		headings = Array.from(headingElements).map((element, index) => {
			const uid = `heading-${index}`;
			element.id = uid;
			return {
				level: parseInt(element.tagName.substring(1)),
				text: element.textContent || '',
				uid
			};
		});
	});
</script>

<svelte:head>
	<title>Custom components</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10">
		<h1>Custom components</h1>
		<p class="max-w-2xl text-lg">
			For circuits demanding specialized components, Zap delivers the intuitive tools you need to easily manufacture your own.
		</p>
		<h2>Base template</h2>
		<p>
			Let's create a new component, called <span class="text-component font-mono">square</span>. Start by copying the code below into your own
			Typst project. You can already see you can use the quick <span class="text-component font-mono">component</span> and
			<span class="text-component font-mono">interface</span> utilities of Zap, which automatically handle wiring and positioning for you.
		</p>
		<Code
			content={`#import "@preview/zap:${version}": component, interface, draw as d\n` +
				'\n' +
				'#let square(name, node, ..params) = {\n' +
				'    // New component style\n' +
				'    let style = (\n' +
				'        width: 1,\n' +
				'		height: 1\n' +
				'    )\n' +
				'    \n' +
				'    // Drawing function\n' +
				'    let draw(ctx, position, style) = {\n' +
				'        interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: position.len() < 2)\n' +
				'        \n' +
				'        rect((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), fill: white, ..style)\n' +
				'    }\n' +
				'   \n' +
				'    // Componant call\n' +
				'    component("square", name, node, draw: draw, style: style, ..params)\n' +
				'}'}
		/>

		<h2>Component drawing</h2>
		<p>
			Your component is now ready to be used inside your circuits! You can draw any component shapes by directly using <a
				target="_blank"
				href="https://cetz-package.github.io/docs/">CeTZ</a
			>. Moreover, the
			<span class="text-component font-mono">draw</span> function provides a set of constants to help you draw complex shapes:
		</p>
		<ul class="ms-5 block space-y-2.5">
			<li>
				<span class="font-mono">ctx</span> <Type type="context" /> the CeTZ drawing context, which
				you can use to resolve coordinates, strokes, etc.
			</li>
			<li>
				<span class="font-mono">position</span> <Type type="coordinate" /> a 2d array
				representing the <span class="text-string font-mono">x</span> and <span class="text-string font-mono">y</span> values of the center coordinate
			</li>
			<li>
				<span class="font-mono">style</span> <Type type="dictionary" /> the styling attributes
				resolved with your custom <span class="text-component font-mono">style</span> constant. It also contains basic styling attributes like
				<span class="text-string font-mono">variant</span>, <span class="text-string font-mono">stroke</span>,
				<span class="text-string font-mono">fill</span>, etc.
			</li>
		</ul>
		<p>
			Our
			<span class="text-component font-mono">square</span> component is currently represented by ... a square. We also want to be able to tune
			the square dimensions in our parameters when calling our component inside our circuits. To do this, we declare this variables inside the
			<span class="text-string font-mono">style</span> constant.
		</p>
		<p>
			The <span class="text-component font-mono">interface</span> manages the wiring, and takes the following parameters:
		</p>
		<ul class="ms-5 space-y-2.5">
			<li>
				<span class="font-mono">node1</span> <Type type="coordinate" /> a 2d array representing
				your component input position, used for automatic wiring
			</li>
			<li>
				<span class="font-mono">node2</span> <Type type="coordinate" /> a 2d array representing
				your component output position, used for automatic wiring
			</li>
			<li><span class="font-mono">io</span> <Type type="boolean" /> fefe</li>
		</ul>
	</main>
	<div class="relative hidden w-72 flex-none p-5 md:block">
		<ul class="sticky top-32 block">
			{#each headings as heading}
				<li style="margin-left: {heading.level * 10}px;">
					<NavButton href={`#${heading.uid}`}>
						{heading.text}
					</NavButton>
				</li>
			{/each}
		</ul>
	</div>
</div>
