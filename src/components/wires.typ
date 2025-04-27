#import "../dependencies.typ": cetz
#import cetz.draw: line, get-ctx
#import cetz.coordinate: resolve

#let wire(..params) = {
    get-ctx(ctx => {
        let wires-stroke = 0.6pt
        let points = params.pos()
        let options = params.named()
        if points.len() < 2 {
            return
        }
        let orthogonal-points = ()
        orthogonal-points.push(points.at(0))
        for i in range(1, points.len()) {
            let p1 = points.at(i - 1)
            let p2 = points.at(i)
            let p1-is-string = type(p1) == str
            let p2-is-string = type(p2) == str
            let a = 0
            let (x1,y1) = (0,0)
            let (x2,y2) = (0,0)
            if (type(p1) == str) {
                let (ctx,point) = resolve(ctx, p1)
                (x1, y1, a) = (point)
            } else {
                (x1, y1) = p1
            }
            if (type(p2) == str) {
                let (ctx,point) = resolve(ctx, p2)
                (x2, y2, a) = (point)
            } else {
                (x2, y2) = p2
            }
            if x1 != x2 and y1 != y2 {
                let intermediate = (x2, y1)
                orthogonal-points.push(intermediate)
            }
            orthogonal-points.push(p2)
        }

        line(..orthogonal-points, stroke: wires-stroke, ..options)
    })
}