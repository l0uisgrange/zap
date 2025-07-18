#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *
    draw.set-style(zap: (scale: 1))

    // Method 1: Using tunnel-diode convenience function
    tunnel-diode("td1", (0,0), (3,0), label: (content: $"TD"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
    
    // Method 2: Using main diode function with tunnel parameter
    diode("td2", (0,-2), (3,-2), tunnel: true, label: (content: $"TD"_2$, anchor: "south"), n: "*-*", i: (label: $i_2$, position: left), u: $u_2$)
}) 