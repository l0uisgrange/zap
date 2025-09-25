<script lang="ts">
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import NexPrev from '$lib/components/NexPrev.svelte';
	import Code from '$lib/components/Code.svelte';
	import style1 from '$lib/examples/style1.svg';
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
	<title>Styling</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10">
		<h1>Styling</h1>
		<p class="max-w-2xl text-lg">
			Zap allows you to style most electrical components using optional arguments passed during their declaration or simple global settings.
		</p>
		<h2>Specific component</h2>
		<p>
			If you want to customize the appearance of a <span class="font-medium">single component instance</span>, rather than all components of the
			same type, simply use the various
			<span class="text-params font-mono">params</span> optional arguments.
		</p>
		<Code
			content={'#zap.circuit({\n' +
				'    import zap: *\n\n' +
				'    resistor("r1", (0,0), (3,0), variant: "iec", fill: red.lighten(80%), stroke: 1pt + red)\n})'}
		/>
		<h2>Global styling</h2>
		<p>
			If you wish to change the default appearance for <span class="font-medium">all components</span>
			of a specific type throughout the same circuit, Zap supports the
			<span class="text-import font-mono">set-style</span> from CeTZ.
		</p>
		<div class="grid gap-5 lg:grid-cols-4">
			<img src={style1} class="dark:border-neutral-border w-full rounded-lg border border-neutral-200 object-cover" alt="Style 1 example" />
			<div class="lg:col-span-3">
				<Code
					content={'#zap.circuit({\n' +
						'    import zap: *\n' +
						'    set-style(zap: (\n' +
						'        resistor: (\n' +
						'            variant: "iec", \n' +
						'            fill: red.lighten(80%), \n' +
						'            stroke: 1pt + red\n' +
						'        ),\n' +
						'        wires: (stroke: .5pt+blue)\n' +
						'    ))\n\n    // Your amazing circuit\n})'}
				/>
			</div>
		</div>
		<h2>Style resolution</h2>
		<p>
			Zap first takes the style from the optional <span class="text-params font-mono">params</span>
			of your components, and merges them (with override) with the
			<span class="text-import font-mono">set-style</span> options.
		</p>
        <h2>List of parameters</h2>
        <p>Below is the list of possible parameters with their default values you can use either in the <span class="font-mono">set-style</span> or in the components themselves.</p>
        <Code content={'#let default-styles = (\n'+
'    variant: "iec",\n'+
'    scale: (x: 1.0, y: 1.0),\n'+
'    stroke: (thickness: .8pt, paint: black),\n'+
'    label: (\n'+
'        scale: auto,\n'+
'        content: none,\n'+
'        distance: 7pt,\n'+
'        anchor: "north",\n'+
'    ),\n'+
'    node: (\n'+
'        radius: .05,\n'+
'        stroke: (thickness: .4pt, paint: black),\n'+
'        fill: black,\n'+
'        nofill: white,\n'+
'    ),\n'+
'    wire: (\n'+
'        stroke: (thickness: .5pt, paint: black),\n'+
'    ),\n'+
'    arrow: (\n'+
'        variant: "default",\n'+
'        scale: 1.0,\n'+
'        stroke: (thickness: 1pt, paint: black),\n'+
'        variable: (\n'+
'            length: 40pt,\n'+
'            angle: 55deg,\n'+
'            ratio: (0.5, 0.5),\n'+
'        ),\n'+
'        radiation: (\n'+
'            scale: 0.8,\n'+
'            stroke: (thickness: .55pt, paint: black),\n'+
'            distance: 3pt,\n'+
'            length: 12pt,\n'+
'            angle: -120deg,\n'+
'            reversed: false,\n'+
'        ),\n'+
'        adjustable: (\n'+
'            length: 0.8,\n'+
'        ),\n'+
'    ),\n'+
'    debug: (\n'+
'        radius: .7pt,\n'+
'        stroke: (\n'+
'            thickness: .2pt,\n'+
'            paint: red,\n'+
'        ),\n'+
'        angle: -30deg,\n'+
'        shift: 3pt,\n'+
'        inset: 1pt,\n'+
'        font: 3pt,\n'+
'        fill: red,\n'+
'    ),\n'+
'    // Components\n'+
'    capacitor: (\n'+
'        width: .8,\n'+
'        distance: .25,\n'+
'        radius: 0.6,\n'+
'        angle: 40deg,\n'+
'    ),\n'+
'    diode: (\n'+
'        radius: .3,\n'+
'        width: .25,\n'+
'        tunnel-length: .11,\n'+
'    ),\n'+
'    opamp: (\n'+
'        width: 1.8,\n'+
'        height: 1.75,\n'+
'        padding: .28,\n'+
'        sign-stroke: .55pt,\n'+
'        sign-size: .14,\n'+
'        sign-delta: .45,\n'+
'    ),\n'+
'    switch: (\n'+
'        width: .8,\n'+
'        angle: 35deg,\n'+
'    ),\n'+
'    fuse: (\n'+
'        width: .88,\n'+
'        height: .88 / 2.4,\n'+
'        asymmetry: 25%,\n'+
'    ),\n'+
'    ground: (\n'+
'        radius: 0.22,\n'+
'        distance: 0.28,\n'+
'    ),\n'+
'    frame: (\n'+
'        width: 0.46,\n'+
'        angle: 20deg,\n'+
'        depth: 0.25,\n'+
'        distance: 0.28,\n'+
'    ),\n'+
'    earth: (\n'+
'        width: .53,\n'+
'        delta: .09,\n'+
'        spacing: .11,\n'+
'        distance: .28,\n'+
'    ),\n'+
'    vcc: (\n'+
'        angle: 35deg,\n'+
'        radius: .4,\n'+
'        distance: .6,\n'+
'    ),\n'+
'    vee: (\n'+
'        angle: 35deg,\n'+
'        radius: .4,\n'+
'        distance: .6,\n'+
'    ),\n'+
'    inductor: (\n'+
'        width: 1.41,\n'+
'        height: 1.41 / 3,\n'+
'        bumps: 3,\n'+
'    ),\n'+
'    resistor: (\n'+
'        width: 1.41,\n'+
'        height: .47,\n'+
'        zigs: 3,\n'+
'    ),\n'+
'    vsource: (\n'+
'        radius: .53,\n'+
'        padding: .25,\n'+
'        sign-stroke: .55pt,\n'+
'        sign-size: .14,\n'+
'        sign-delta: .07,\n'+
'    ),\n'+
'    isource: (\n'+
'        radius: .53,\n'+
'        padding: .25,\n'+
'        arrow-scale: 1,\n'+
'    ),\n'+
'    acmotor: (\n'+
'        radius: .49,\n'+
'        magnet-width: 1.23,\n'+
'        magnet-height: 1.23 / 4,\n'+
'    ),\n'+
'    dcmotor: (\n'+
'        radius: .49,\n'+
'        magnet-width: 1.23,\n'+
'        magnet-height: 1.23 / 4,\n'+
'    ),\n'+
'    bjt: (\n'+
'        radius: .65,\n'+
'        base-height: .6,\n'+
'        base-distance: .12,\n'+
'        aperture: 50deg,\n'+
'    ),\n'+
'    mosfet: (\n'+
'        height: 0.795,\n'+
'        width: 1.065,\n'+
'        base-width: 1.35,\n'+
'        base-spacing: 0.165,\n'+
'        base-distance: 0.165,\n'+
'        radius: 1.05,\n'+
'    ),\n'+
'    antenna: (\n'+
'        distance: 0.8,\n'+
'        spacing: 0.35,\n'+
'        length: 0.5,\n'+
'    ),\n'+
'    transformer: (\n'+
'        radius: 0.35,\n'+
'        distance: 0.45,\n'+
'    ),\n'+
'    converter: (\n'+
'        width: 1.7,\n'+
'        height: 0.7,\n'+
'        arrow-width: 0.4,\n'+
'        label: (\n'+
'            align: "center",\n'+
'        ),\n'+
'    ),\n'+
'    mcu: (\n'+
'        width: 3,\n'+
'        min-height: 1,\n'+
'        padding: 0.2,\n'+
'        spacing: 0.4,\n'+
'    )\n'+
')'} />
		<NexPrev previous={{ href: '/docs/decorations', title: 'Decorations' }} />
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
