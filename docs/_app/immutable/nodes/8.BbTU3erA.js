import{t as m,a as c}from"../chunks/BvwZg8ig.js";import"../chunks/CGvYWwZM.js";import{$ as d,d as o,c as a,r as t}from"../chunks/B1RcoXXJ.js";import{h as p}from"../chunks/Ddwf6uy6.js";import{s as u}from"../chunks/B2kA5CkY.js";import{C as v}from"../chunks/CMk_7SIp.js";const g=""+new URL("../assets/example1.DtUNQ4yC.svg",import.meta.url).href;var b=m(`<main class="block p-5 py-10"><h1>Examples</h1> <p class="max-w-2xl text-lg">Explore the examples below to see Circuitor's advanced capabilities in action and discover
		just how easy it is to program complex circuit diagrams.</p> <h2>Simple example</h2> <div class="grid gap-7 md:grid-cols-2"><div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white"><img alt="example1" class="p-10"></div> <!></div></main>`);function E(s){var r=b();p(h=>{d.title="Getting started"});var i=o(a(r),6),e=a(i),l=a(e);u(l,"src",g),t(e);var n=o(e,2);v(n,{content:`#circuitor.canvas({
    import circuitor: *

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
})`}),t(i),t(r),c(s,r)}export{E as component};
