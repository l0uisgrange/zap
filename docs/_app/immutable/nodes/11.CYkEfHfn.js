import{f as _,a as c,t as N}from"../chunks/oJKTXW1w.js";import{o as Z}from"../chunks/C-3Kyn5p.js";import{p as I,s as q,b as A,t as d,d as D,$ as G,f as o,c as a,h as L,r as e,g as r,n as P,i as T}from"../chunks/DVT4hDLY.js";import{s as j}from"../chunks/BB7nONM-.js";import{e as B,i as E}from"../chunks/qpBUtXQW.js";import{h as M}from"../chunks/B7ldBpxJ.js";import{b as R,s as U}from"../chunks/KwVppFjo.js";import{N as V}from"../chunks/Bi3WnnRN.js";import{N as Y}from"../chunks/ClUlapyR.js";import{C as b}from"../chunks/DGzpS7Y4.js";const F=""+new URL("../assets/style1.CGwDqTVL.svg",import.meta.url).href;var H=_("<li><!></li>"),J=_(`<div class="items-stretch md:flex"><main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10"><h1>Styling</h1> <p class="max-w-2xl text-lg">Zap allows you to style most electrical components using optional arguments passed
			during their declaration or simple global settings.</p> <h2>Specific component</h2> <p>If you want to customize the appearance of a <span class="font-medium">single component instance</span>, rather than all components of the same type, simply use the various <span class="text-params font-mono">params</span> optional arguments.</p> <!> <h2>Global styling</h2> <p>If you wish to change the default appearance for <span class="font-medium">all components</span> of a specific type throughout the same canvas, Zap supports the <span class="text-import font-mono">set-style</span> from CeTZ.</p> <div class="grid gap-5 lg:grid-cols-4"><img class="dark:border-neutral-border w-full rounded-lg border border-neutral-200 object-cover" alt="Style 1 example"/> <div class="lg:col-span-3"><!></div></div> <h2>Style resolution</h2> <p>Zap first takes the style from the optional <span class="text-params font-mono">params</span> of your components, and merges them (with override) with the <span class="text-import font-mono">set-style</span> options.</p> <!></main> <div class="relative hidden w-72 flex-none p-5 md:block"><ul class="sticky top-32 block"></ul></div></div>`);function nt($,w){I(w,!0);let h=q(A([]));Z(()=>{const n=document.querySelectorAll("h1, h2, h3");L(h,Array.from(n).map((t,s)=>{const i=`heading-${s}`;return t.id=i,{level:parseInt(t.tagName.substring(1)),text:t.textContent||"",uid:i}}),!0)});var p=J();M(n=>{G.title="Styling"});var l=a(p),u=o(a(l),8);b(u,{content:`#zap.canvas({
    import zap: *

    resistor("r1", (0,0), (3,0), variant: "iec", fill: red.lighten(80%), stroke: 1pt + red)
})`});var m=o(u,6),f=a(m),v=o(f,2),k=a(v);b(k,{content:`#zap.canvas({
    import zap: *
    set-style(zap: (
        resistor: (
            variant: "iec", 
            fill: red.lighten(80%), 
            stroke: 1pt + red
        ),
        wires: (stroke: .5pt+blue)
    ))

    // Your amazing circuit
})`}),e(v),e(m);var z=o(m,6);Y(z,{previous:{href:"/zap/docs/decorations",title:"Decorations"}}),e(l);var g=o(l,2),y=a(g);B(y,21,()=>r(h),E,(n,t)=>{var s=H(),i=a(s);const S=T(()=>`#${r(t).uid}`);V(i,{get href(){return r(S)},children:(C,K)=>{P();var x=N();d(()=>j(x,r(t).text)),c(C,x)},$$slots:{default:!0}}),e(s),d(()=>U(s,`margin-left: ${r(t).level*10}px;`)),c(n,s)}),e(y),e(g),e(p),d(()=>R(f,"src",F)),c($,p),D()}export{nt as component};
