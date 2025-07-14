import{f as N,a as v,t as F}from"../chunks/oJKTXW1w.js";import{o as L}from"../chunks/C-3Kyn5p.js";import{p as O,s as P,b as W,g as i,d as G,$ as H,f as t,c as n,i as q,h as J,n as s,r as e,t as T}from"../chunks/DVT4hDLY.js";import{s as K}from"../chunks/BB7nONM-.js";import{e as Q,i as R}from"../chunks/qpBUtXQW.js";import{h as U}from"../chunks/B7ldBpxJ.js";import{s as V}from"../chunks/KwVppFjo.js";import{N as X}from"../chunks/D1n22Nx9.js";import{C as tt}from"../chunks/BBmh62mE.js";import{T as r}from"../chunks/CrpPZkct.js";import{v as et}from"../chunks/BPOdOirp.js";var nt=N("<li><!></li>"),ot=N(`<div class="items-stretch md:flex"><main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10"><h1>Custom components</h1> <p class="max-w-2xl text-lg">For circuits demanding specialized components, Zap delivers the intuitive tools you need to easily manufacture your own.</p> <h2>Base template</h2> <p>Let's create a new component, called <span class="text-component font-mono">square</span>. Start by copying the code below into your own
			Typst project. You can already see you can use the quick <span class="text-component font-mono">component</span> and <span class="text-component font-mono">interface</span> utilities of Zap, which automatically handle wiring and positioning for you.</p> <!> <h2>Component drawing</h2> <p>Your component is now ready to be used inside your circuits! You can draw any component shapes by directly using <a target="_blank" href="https://cetz-package.github.io/docs/">CeTZ</a>. Moreover, the <span class="text-component font-mono">draw</span> function provides a set of constants to help you draw complex shapes:</p> <ul class="ms-5 block space-y-2.5"><li><span class="font-mono">ctx</span> <!> the CeTZ drawing context, which
				you can use to resolve coordinates, strokes, etc.</li> <li><span class="font-mono">position</span> <!> a 2d array
				representing the <span class="text-string font-mono">x</span> and <span class="text-string font-mono">y</span> values of the center coordinate</li> <li><span class="font-mono">style</span> <!> the styling attributes
				resolved with your custom <span class="text-component font-mono">style</span> constant. It also contains basic styling attributes like <span class="text-string font-mono">variant</span>, <span class="text-string font-mono">stroke</span>, <span class="text-string font-mono">fill</span>, etc.</li></ul> <p>Our <span class="text-component font-mono">square</span> component is currently represented by ... a square. We also want to be able to tune
			the square dimensions in our parameters when calling our component inside our circuits. To do this, we declare this variables inside the <span class="text-string font-mono">style</span> constant.</p> <p>The <span class="text-component font-mono">interface</span> manages the wiring, and takes the following parameters:</p> <ul class="ms-5 space-y-2.5"><li><span class="font-mono">node1</span> <!> a 2d array representing
				your component input position, used for automatic wiring</li> <li><span class="font-mono">node2</span> <!> a 2d array representing
				your component output position, used for automatic wiring</li> <li><span class="font-mono">io</span> <!> fefe</li></ul></main> <div class="relative hidden w-72 flex-none p-5 md:block"><ul class="sticky top-32 block"></ul></div></div>`);function ft(Z,z){O(z,!0);let g=P(W([]));L(()=>{const p=document.querySelectorAll("h1, h2, h3");J(g,Array.from(p).map((o,a)=>{const l=`heading-${a}`;return o.id=l,{level:parseInt(o.tagName.substring(1)),text:o.textContent||"",uid:l}}),!0)});var c=ot();U(p=>{H.title="Custom components"});var m=n(c),x=t(n(m),8);const Y=q(()=>`#import "@preview/zap:${et}": component, interface, draw as d

#let square(name, node, ..params) = {
    // New component style
    let style = (
        width: 1,
		height: 1
    )
    
    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: position.len() < 2)
        
        rect((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), fill: white, ..style)
    }
   
    // Componant call
    component("square", name, node, draw: draw, style: style, ..params)
}`);tt(x,{get content(){return i(Y)}});var d=t(x,6),u=n(d),A=t(n(u),2);r(A,{type:"context"}),s(),e(u);var h=t(u,2),B=t(n(h),2);r(B,{type:"coordinate"}),s(5),e(h);var w=t(h,2),I=t(n(w),2);r(I,{type:"dictionary"}),s(9),e(w),e(d);var _=t(d,6),y=n(_),M=t(n(y),2);r(M,{type:"coordinate"}),s(),e(y);var f=t(y,2),S=t(n(f),2);r(S,{type:"coordinate"}),s(),e(f);var b=t(f,2),j=t(n(b),2);r(j,{type:"boolean"}),s(),e(b),e(_),e(m);var $=t(m,2),k=n($);Q(k,21,()=>i(g),R,(p,o)=>{var a=nt(),l=n(a);const D=q(()=>`#${i(o).uid}`);X(l,{get href(){return i(D)},children:(E,st)=>{s();var C=F();T(()=>K(C,i(o).text)),v(E,C)},$$slots:{default:!0}}),e(a),T(()=>V(a,`margin-left: ${i(o).level*10}px;`)),v(p,a)}),e(k),e($),e(c),v(Z,c),G()}export{ft as component};
