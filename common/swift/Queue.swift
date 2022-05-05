struct Queue<T> {
    private var head = 0
    private(set) var array = [T?]()
    public var count: Int { array.count - head }
    public var isEmpty: Bool { count == 0 }
    public var front: T? { isEmpty ? nil : array[head] }

    public mutating func push(_ e: T) { array.append(e) }

    @discardableResult
    public mutating func pop() -> T? {
        guard (array.startIndex..<array.endIndex).contains(head) else { return nil }
        let e = array[head]
        array[head] = nil
        head += 1
        let rate = Double(head) / Double(array.count)
        if array.count > 50 && rate > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        return e
    }
}
