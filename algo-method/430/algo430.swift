struct MemoIndex<T: Hashable>: Hashable {
    static func ==(lhs: MemoIndex<T>, rhs: MemoIndex<T>) -> Bool {
        lhs.arr == rhs.arr && lhs.idx == rhs.idx
    }
    var arr: [T]
    var idx: UInt
    init(a: [T], i: UInt) {
        arr = a
        idx = i
    }
}

class PrimitiveRecursion<T: Hashable, U> {
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

let (N, L, R) = { () -> (Int, Int, Int) in
    let v = readLine()!.split(separator:" ").map{Int($0)!}
    return (v[0], v[1], v[2])
}()

var args: [Int] = [N, L, R]
print(
        PrimitiveRecursion<Int, Int>().calc(
                array: args,
                regressive: UInt(N),
                base: { arg in 1 },
                step: { arg, reg, f in
                    let (n, l, r) = (arg[0], arg[1], arg[2])
                    guard l <= r else { return 0 }
                    return f([n - 1, l + 1, r], UInt(n - 1)) + f([n, l + 1, r], UInt(n))
                }
        )
)
