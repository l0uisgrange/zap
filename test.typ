
#import "/src/lib.typ": *

#circuit(debug: false, {
  pmos_simple("t1", (0,-2))
  nmos_simple("t2", (0, 2))
  swire("t1.g", "t2.g")
  swire("t1.d", "t2.s")

  anand("l1", (9, 0))
  anot("l3", (8, -2))
  axnor("l4", (10, -4), rotate: 90deg)
  alogic("l5", (12, 0),text: $>=1$, inputs: 3, invert: true)
  dflipflop_top("ff",(5,-10), rotate:0deg)

  zwire("l1.out", "l5.in1")
  zwire("l3.out", "l5.in2")
  zwire(bits: "2","l4.out", "l5.in3")
  
  dec2to4("dec", (5,-15), description: true, rotate: 180deg)
  reg2bit("mux", (2, -10), rotate: 0deg)
  zero_extend("ze", (5,0), rotate: 0deg)
  wire("l1.in1", "ze.out", bits: "41")

  zwire(bits: "N", "mux.rst","dec.out0")
 


 
})


 #circuit({
        wire((0, 0), (1, 0))
        zwire((2, 0), (4, 2), stroke: blue)
        swire((5, 2), (6, -1), stroke: red)

        zwire((7, 0), (9, 2), bits: "N")
        zwire((10, 0), (11, 2), bits: 2)
        
    })
