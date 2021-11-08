struct UnionFindTree {
    let vertexCount: Int
    var parentOrSize: [Int]

    init(withVertexCount n: Int) {
        vertexCount = n
        parentOrSize = .init(repeating: -1, count: n)
    }

    @discardableResult
    mutating func merge(_ lhs: Int, _ rhs: Int) -> Bool {
        precondition(0 <= lhs && lhs <= vertexCount)
        precondition(0 <= rhs && rhs <= vertexCount)
        var (x, y) = (leader(of: lhs), leader(of: rhs))
        guard x != y else { return false }
        if -parentOrSize[x] < -parentOrSize[y] { swap(&x, &y) }
        parentOrSize[x] += parentOrSize[y]
        parentOrSize[y] = x
        return true
    }

    mutating func isSame(_ lhs: Int, _ rhs: Int) -> Bool {
        precondition(0 <= lhs && lhs <= vertexCount)
        precondition(0 <= rhs && rhs <= vertexCount)
        return leader(of: lhs) == leader(of: rhs)
    }

    mutating func leader(of a:Int) -> Int {
        precondition(0 <= a && a <= vertexCount)
        guard parentOrSize[a] >= 0 else { return a }
        let ld = leader(of: parentOrSize[a])
        parentOrSize[a] = ld
        return ld
    }
}


func cin2i() -> (Int, Int) {
    let v = readLine()!.split(separator:" ").map{Int(String($0))!}
    return (v[0], v[1])
}

func cin3i() -> (Int, Int, Int) {
    let v = readLine()!.split(separator:" ").map{Int(String($0))!}
    return (v[0], v[1], v[2])
}

let (N, Q) = cin2i()
var W = readLine()!.split(separator:" ").map{Int($0)!}

var uf = UnionFindTree(withVertexCount: N)

for _ in 0..<Q {
    let (t, x, y) = cin3i()
    let px = uf.leader(of: x)
    let py = uf.leader(of: y)

    if t == 0 {
        let w = W[px] + W[py]
        if uf.merge(px, py) {
            W[uf.leader(of: x)] = w
        }
    } else {
        print(W[uf.leader(of: x)])
    }
}
