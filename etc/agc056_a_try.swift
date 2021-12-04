import Foundation

struct Array2D<Element>: Sequence, CustomStringConvertible {
    let width: Int
    let height: Int
    private(set) var elements: [Element]
    let outside: Element?
    init(width: Int, height: Int, elements: [Element], outside: Element? = nil) {
        precondition(elements.count == width * height)
        self.width = width
        self.height = height
        self.elements = elements
        self.outside = outside
    }
    init(width: Int, height: Int, element: Element, outside: Element? = nil) {
        self.init(width: width, height: height, elements: [Element](repeating: element, count: width * height), outside: outside)
    }
    var count: Int { elements.count }
    var xRange: Range<Int> { 0 ..< width }
    var yRange: Range<Int> { 0 ..< height }
    private func indexAt(x: Int, y: Int) -> Int? {
        guard xRange.contains(x) else { return nil }
        guard yRange.contains(y) else { return nil }
        return y * width + x
    }
    subscript(x: Int, y: Int) -> Element {
        get {
            guard let i = indexAt(x: x, y: y) else { return outside! }
            return elements[i]
        }
        set {
            guard let i = indexAt(x: x, y: y) else {
                precondition(outside != nil)
                return
            }
            elements[i] = newValue
        }
    }
    subscript(position: (Int, Int)) -> Element {
        get { self[position.0, position.1] }
        set { self[position.0, position.1] = newValue }
    }
    func makeIterator() -> IndexingIterator<[Element]> {
        elements.makeIterator()
    }
    func map<T>(_ transform: (Element) throws -> T) rethrows -> Array2D<T> {
        try Array2D<T>(width: width, height: height, elements: elements.map(transform))
    }
    var description: String {
        var result: String = ""
        for y in yRange {
            for x in xRange {
                result.append("\(self[x, y])")
            }
            result.append("\n")
        }
        return result
    }
}
extension Array2D where Element: CustomStringConvertible {
    var description: String {
        var result: String = ""
        for y in yRange {
            for x in xRange {
                result.append(self[x, y].description)
            }
            result.append("\n")
        }
        return result
    }
}

let N = Int(readLine()!)!
var a = Array2D<Int>(width: N, height: N, element: 3)

func updateBoard(_ r: Int, _ c: Int) {
    for ir in a.yRange where ir != r && a[(ir, c)] != -1 {
        a[(ir, c)] = max(a[(ir, c)] - 1, 0)
    }
    for ic in a.xRange where ic != c && a[(r, ic)] != -1 {
        a[(r, ic)] = max(a[(r, ic)] - 1, 0)
    }
}

for i in 0..<(N - 2) {
    a[(i, i)] = -1
    updateBoard(i, i)
}

for r in a.yRange {
    for c in r..<N where a[(r, c)] > 0 && a[(c, r)] > 0 {
        // wrong!
        a[(r, c)] = -1
        a[(c, r)] = -1
        updateBoard(r, c)
        updateBoard(c, r)
    }
}

var ans = Array2D<String>(width: N, height: N, element: ".")
for r in a.yRange {
    for c in a.xRange where a[(r, c)] == -1 {
        ans[(r, c)] = "#"
    }
}
print(ans)
