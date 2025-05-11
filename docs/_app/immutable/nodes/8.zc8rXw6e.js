import{t as m,a as p}from"../chunks/C-hBxsOW.js";import"../chunks/C-km6zZ8.js";import{$ as c,c as a,e as s,r as t}from"../chunks/DhzbSWZ_.js";import{h as d}from"../chunks/C_g7wnIQ.js";import{s as v}from"../chunks/h7lXfR73.js";import{C as g}from"../chunks/BtYiqYoW.js";const u=""+new URL("../assets/example1.DtUNQ4yC.svg",import.meta.url).href;var b=m(`<main class="block p-5 py-10"><h1>Examples</h1> <p class="max-w-2xl text-lg">Explore the examples below to see Zap's advanced capabilities in action and discover just
		how easy it is to program complex circuit diagrams.</p> <h2>Simple example</h2> <div class="grid gap-7 md:grid-cols-2"><div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white"><img alt="example1" class="p-10"></div> <!></div></main>`);function E(i){var e=b();d(h=>{c.title="Getting started"});var o=s(a(e),6),r=a(o),l=a(r);v(l,"src",u),t(r);var n=s(r,2);g(n,{content:`#zap.canvas({
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
})`}),t(o),t(e),p(i,e)}export{E as component};
