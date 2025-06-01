import{f as b,a as u}from"../chunks/oJKTXW1w.js";import"../chunks/DGKY0cM1.js";import{t as h,$ as f,f as a,c as e,r}from"../chunks/DVT4hDLY.js";import{h as x}from"../chunks/B7ldBpxJ.js";import{b as i}from"../chunks/KwVppFjo.js";import{C as m}from"../chunks/DGzpS7Y4.js";const w=""+new URL("../assets/example1.DtUNQ4yC.svg",import.meta.url).href,$=""+new URL("../assets/example2.CF_ci4HO.svg",import.meta.url).href;var _=b(`<main class="block p-5 py-10"><h1>Examples</h1> <p class="max-w-2xl text-lg">Explore the examples below to see Zap's advanced capabilities in action and discover just
		how easy it is to program complex circuit diagrams.</p> <h2>Simple example</h2> <div class="grid gap-7 md:grid-cols-2"><div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white"><img alt="example1" class="p-10"/></div> <!></div> <h2>Wheatstone bridge</h2> <div class="grid gap-7 md:grid-cols-2"><div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white"><img alt="example2" class="p-10"/></div> <!></div></main>`);function k(d){var t=_();x(C=>{f.title="Getting started"});var l=a(e(t),6),o=e(l),c=e(o);r(o);var p=a(o,2);m(p,{content:`#zap.canvas({
    import zap: *

    // Branch 1
    resistor("r1", (0,3), (3,3), label: $3 Omega$)
    vsource("v1", (0,0), (0,3), label: "V1")
    resistor("r2", (0,0), (0,-3), label: $4 Omega$)

    // Branch 2
    led("l1", "r1.out", (rel: (0,-6)), label: "LED")
    inductor("i2", "r1.out", (rel: (3,0)), label: $6 mu"H"$)
    resistor("r3", "i2.out", (rel: (0,-6)), label: $2 Omega$)

    // Wiring
    wire("r2.out", "r3.out")
})`}),r(l);var n=a(l,4),s=e(n),v=e(s);r(s);var g=a(s,2);m(g,{content:`#zap.canvas({
    import zap: *

    // Wheatstone bridge
    resistor("r1", (4,0), (6,2), label: "R1", adjustable: true)
    resistor("r2", (6,2), (4,4), label: "R2", label-angle: 180deg)
    resistor("r3", (4,0), (2,2), label: "R3")
    resistor("r4", (2,2), (4,4), label: "R4", label-angle: -180deg)

    // Voltage source
    vsource("v1", (0,0), (0,4), label: "3V")

    // Capacitor & motor
    capacitor("c1", "r2.out", (8,4), label: "C1")
    dcmotor("m1", "c1.out", (rel: (0,-4)))

    // Wiring
    wire("v1.minus", "m1.out")
    wire("v1.plus", "r4.out")
})`}),r(n),r(t),h(()=>{i(c,"src",w),i(v,"src",$)}),u(d,t)}export{k as component};
