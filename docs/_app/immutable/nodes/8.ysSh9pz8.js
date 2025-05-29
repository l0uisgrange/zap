import{t as T,a as v,b as D}from"../chunks/BlrYobGK.js";import{p as E,s as F,b as L,d as O,$ as P,f as t,c as n,g as W,n as s,r as e,h as r,t as q,i as G}from"../chunks/DMj_VD0d.js";import{s as H}from"../chunks/DxafIrDU.js";import{e as J,i as K}from"../chunks/CduSz8r5.js";import{h as Q}from"../chunks/R70TowAq.js";import{s as R}from"../chunks/Db0qi7NK.js";import{o as U}from"../chunks/TA8bJr9-.js";import{N as V}from"../chunks/BiCzYUDz.js";import{C as X}from"../chunks/7h6BKf2r.js";import{T as i}from"../chunks/D8TWRjkL.js";import{v as tt}from"../chunks/IURICYjG.js";var et=T("<li><!></li>"),nt=T(`<div class="items-stretch md:flex"><main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10"><h1>Custom components</h1> <p class="max-w-2xl text-lg">For circuits demanding specialized components, Zap delivers the intuitive tools you need to easily manufacture your own.</p> <h2>Base template</h2> <p>Let's create a new component, called <span class="text-component font-mono">square</span>. Start by copying the code below into your own
			Typst project. You can already see you can use the quick <span class="text-component font-mono">component</span> and <span class="text-component font-mono">interface</span> utilities of Zap, which automatically handle wiring and positioning for you.</p> <!> <h2>Component drawing</h2> <p>Your component is now ready to be used inside your circuits! You can draw any component shapes by directly using <a target="_blank" href="https://cetz-package.github.io/docs/">CeTZ</a>. Moreover, the <span class="text-component font-mono">draw</span> function provides a set of constants to help you draw complex shapes:</p> <ul class="ms-5 block space-y-2.5"><li><span class="font-mono">ctx</span> <!> the CeTZ drawing context, which
				you can use to resolve coordinates, strokes, etc.</li> <li><span class="font-mono">position</span> <!> a 2d array
				representing the <span class="text-string font-mono">x</span> and <span class="text-string font-mono">y</span> values of the center coordinate</li> <li><span class="font-mono">style</span> <!> the styling attributes
				resolved with your custom <span class="text-component font-mono">style</span> constant. It also contains basic styling attributes like <span class="text-string font-mono">variant</span>, <span class="text-string font-mono">stroke</span>, <span class="text-string font-mono">fill</span>, etc.</li></ul> <p>Our <span class="text-component font-mono">square</span> component is currently represented by ... a square. We also want to be able to tune
			the square dimensions in our parameters when calling our component inside our circuits. To do this, we declare this variables inside the <span class="text-string font-mono">style</span> constant.</p> <p>The <span class="text-component font-mono">interface</span> manages the wiring, and takes the following parameters:</p> <ul class="ms-5 space-y-2.5"><li><span class="font-mono">node1</span> <!> a 2d array representing
				your component input position, used for automatic wiring</li> <li><span class="font-mono">node2</span> <!> a 2d array representing
				your component output position, used for automatic wiring</li> <li><span class="font-mono">io</span> <!> fefe</li></ul></main> <div class="relative hidden w-72 flex-none p-5 md:block"><ul class="sticky top-32 block"></ul></div></div>`);function yt(N,Z){E(Z,!0);let g=F(L([]));U(()=>{const p=document.querySelectorAll("h1, h2, h3");W(g,Array.from(p).map((o,a)=>{const l=`heading-${a}`;return o.id=l,{level:parseInt(o.tagName.substring(1)),text:o.textContent||"",uid:l}}),!0)});var c=nt();Q(p=>{P.title="Custom components"});var m=n(c),x=t(n(m),8);X(x,{content:`#import "@preview/zap:${tt}": component, interface, draw as d

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
}`});var d=t(x,6),u=n(d),z=t(n(u),2);i(z,{type:"context"}),s(),e(u);var h=t(u,2),Y=t(n(h),2);i(Y,{type:"coordinate"}),s(5),e(h);var w=t(h,2),A=t(n(w),2);i(A,{type:"dictionary"}),s(9),e(w),e(d);var _=t(d,6),y=n(_),B=t(n(y),2);i(B,{type:"coordinate"}),s(),e(y);var f=t(y,2),I=t(n(f),2);i(I,{type:"coordinate"}),s(),e(f);var b=t(f,2),M=t(n(b),2);i(M,{type:"boolean"}),s(),e(b),e(_),e(m);var $=t(m,2),k=n($);J(k,21,()=>r(g),K,(p,o)=>{var a=et(),l=n(a);const S=G(()=>`#${r(o).uid}`);V(l,{get href(){return r(S)},children:(j,ot)=>{s();var C=D();q(()=>H(C,r(o).text)),v(j,C)},$$slots:{default:!0}}),e(a),q(()=>R(a,`margin-left: ${r(o).level*10}px;`)),v(p,a)}),e(k),e($),e(c),v(N,c),O()}export{yt as component};
