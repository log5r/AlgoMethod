class BinaryHeapTree: CustomStringConvertible {

    var description: String { array.description }

    var array: [Int] = []
    init(array: [Int]) {
        array.forEach { e in add(value: e) }
    }

    func leftChild(of node: Int) ->  Int { ( node + 1 ) * 2 - 1 }
    func rightChild(of node: Int) ->  Int { ( node + 1 ) * 2 }
    func parent(of node: Int) -> Int { (node + 1) >> 1 - 1 }

    func add(value: Int) {
        array.append(value)
        upHeap(to: array.count - 1)
    }

    func sort() {
        for i in stride(from: array.count - 1, through: 0, by: -1) {
            array.swapAt(0, i)
            downHeap(to: i)
        }
    }

    func upHeap(to node: Int) {
        var n = node
        while n > 0 {
            let m = parent(of: n)
            if array[m] < array[n] { array.swapAt(m, n) }
            else { break }
            n = m
        }
    }

    func downHeap(to node: Int) {
        var m = 0
        var buf = 0
        while true {
            let lc = leftChild(of: m)
            let rc = rightChild(of: m)
            if lc >= node { break }
            if array[lc] > array[buf] { buf = lc }
            if rc < node && (array[rc] > array[buf]) { buf = rc }
            if buf == m { break }
            array.swapAt(buf, m)
            m = buf
        }
    }
}
