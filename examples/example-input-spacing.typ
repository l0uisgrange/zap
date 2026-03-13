
#import "/src/lib.typ"
#set page(width: auto, height: auto, margin: 5pt, fill: white)

#lib.circuit({
    import lib: *

    set-style(logic: (invert-style: "circle"))
    let k = 1.7
    for i in range(1, 5) {
        land("g1" + str(i), (0, k * (i - 1)), inputs: i)
        for j in range(1, i + 1) {
            wstub("g1" + str(i) + ".in" + str(j), label: "Input " + str(j))
        }
    }
    lnot("g2", (0, -k))
    wstub("g2.in1", label: "Input")
})
