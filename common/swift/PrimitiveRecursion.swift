/// 原始再帰っぽい再帰が出来る関数（のつもり）
///
/// - Parameters:
///   - array: 処理対象の配列
///   - regressive: 後退項(Regressive argument)
///   - base: 基底関数を入れるところ
///   - step: 再帰ステップ関数を入れるための再帰項
/// - Returns: 答え
func primitiveRecursion(
        array: [Int],
        regressive: UInt,
        base: ([Int]) -> Int,
        step: @escaping ([Int], UInt, ([Int], UInt) -> Int) -> Int
) -> Int {
    if regressive == 0 {
        return base(array)
    } else {
        return step(array, regressive - 1) { arr, reg in
            primitiveRecursion(array: arr, regressive: reg, base: base, step: step)
        }
    }
}
