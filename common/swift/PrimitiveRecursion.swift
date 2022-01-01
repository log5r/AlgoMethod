class PrimitiveRecursion<T: Hashable, U> {
    struct MemoIndex<T: Hashable>: Hashable {
        static func ==(lhs: MemoIndex<T>, rhs: MemoIndex<T>) -> Bool { lhs.arr == rhs.arr && lhs.idx == rhs.idx }
        var arr: [T], idx: UInt
        init(a: [T], i: UInt) { (arr, idx) = (a ,i) }
    }

    var memo: [MemoIndex<T>: U]
    init() { memo = [:] }
    func calc(array: [T], regressive: UInt, base: ([T]) -> U, step: @escaping ([T], UInt, ([T], UInt) -> U) -> U) -> U {
        if let rv = memo[MemoIndex(a: array, i: regressive)] { return rv }
        let res = regressive == 0 ?
                base(array) :
                step(array, regressive) { arr, reg in
                    calc(array: arr, regressive: reg, base: base, step: step)
                }
        memo[MemoIndex(a: array, i: regressive)] = res
        return res
    }
}
