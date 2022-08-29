import Foundation

extension BinaryInteger {
    // 2進数の文字列表現の自作（計算量はbitWidth依存だから多分どうにかなる...?）
    func binaryDescription(bitWidth: Int?) -> String {
        let bw = bitWidth ?? self.bitWidth
        var res = "", me = self, count = 0
        (1...bw).forEach { _ in
            res.insert(contentsOf: "\(me & 1)", at: res.startIndex)
            me >>= 1
            count += 1
        }
        return res
    }
}
