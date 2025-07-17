import{f as h,a as b}from"../chunks/oJKTXW1w.js";import"../chunks/DGKY0cM1.js";import{t as g,$ as f,f as a,c as e,r}from"../chunks/DVT4hDLY.js";import{h as x}from"../chunks/B7ldBpxJ.js";import{b as i}from"../chunks/KwVppFjo.js";import{C as c}from"../chunks/BBmh62mE.js";const w=""+new URL("../assets/example1.Dhy-44RY.svg",import.meta.url).href,$=""+new URL("../assets/example2.ByqdtndT.svg",import.meta.url).href;var _=h(`<main class="block p-5 py-10"><h1>Examples</h1> <p class="max-w-2xl text-lg">Explore the examples below to see Zap's advanced capabilities in action and discover just how easy it is to program complex circuit diagrams.</p> <h2>Simple example</h2> <div class="grid gap-7 md:grid-cols-2"><div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white"><img alt="example1" class="p-10"/></div> <!></div> <h2>Wheatstone bridge</h2> <div class="grid gap-7 md:grid-cols-2"><div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white"><img alt="example2" class="p-10"/></div> <!></div></main>`);function B(m){var t=_();x(R=>{f.title="Getting started"});var o=a(e(t),6),n=e(o),d=e(n);r(n);var p=a(n,2);c(p,{content:`#zap.canvas({
    import zap: *

    // Branch 1	 resistor("r1", (0,3), (3,3), label: $3 Omega$)
	 vsource("v1", (0,0), (0,3), label: (content: "V1", anchor: "south"))
    resistor("r2", (0,0), (0,-3), label: $4 Omega$)

    // Branch 2
    led("l1", "r1.out", (rel: (0,-6)), label: (content: "LED", anchor: "south"))
    inductor("i2", "r1.out", (rel: (3,0)), label: $6 mu"H"$)
    resistor("r3", "i2.out", (rel: (0,-6)), label: $2 Omega$)

    // Wiring
    wire("r2.out", "r3.out")
})`}),r(o);var l=a(o,4),s=e(l),v=e(s);r(s);var u=a(s,2);c(u,{content:`#zap.canvas({
    import zap: *

    // Wheatstone bridge
    resistor("r1", (4,0), (6,2), label: "R1", variable: true)
    resistor("r2", (6,2), (4,4), label: "R2")
    resistor("r3", (4,0), (2,2), label: (content: "R3", anchor: "south"))
    resistor("r4", (2,2), (4,4), label: (content: "R4", anchor: "south"))

    // Voltage source
    vsource("v1", (0,0), (0,4), label: (content: "R1", anchor: "south"))

    // Capacitor & motor
    capacitor("c1", "r2.out", (8,4), label: "C1")
    dcmotor("m1", "c1.out", (rel: (0,-4)))

    // Wiring
    wire("v1.in", "m1.out")
    wire("v1.out", "r4.out")})`}),r(l),r(t),g(()=>{i(d,"src",w),i(v,"src",$)}),b(m,t)}export{B as component};
