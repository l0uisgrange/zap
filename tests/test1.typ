#set page(margin: 4pt, width: auto, height: auto)
#import "../src/lib.typ"

#lib.canvas({
    import lib: *
    draw.set-style(zap: (scale: 1, debug: true))

    // Branch 1
    /*resistor("r1", (0,3), (3,3), label: $3 Omega$, debug: true)
    vsource("v1", (0,0), (0,3), label: $M$, debug: true)
    resistor("r2", (0,0), (0,-3), label: $4 Omega$, debug: true)*/

    led("r3", (0,-3), (rel: (radius: 2, angle: 0deg)), c: "*-*", label: "D1")
    // Branch 2
    //led("l1", "r1.out", (rel: (0,-6)), label: "LED", debug: true)
    /*inductor("i2", "r1.out", (rel: (3,0)), label: $6 mu"H" Omega not$, debug: true)
    resistor("r3", "i2.out", (rel: (0,-6)), label: $2 Omega$, debug: true)

    // Wiring
    wire("r2.out", "r3.out")*/
})