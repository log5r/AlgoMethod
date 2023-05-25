import Foundation

extension Character {
    func asciiValueInt() -> Int { Int(asciiValue!) }
    func rotateLCA(by count: Int) -> Int {
        func roundIn26(_ i: Int) -> Int { (i % 26 + 26) % 26 }
        let gap = roundIn26(count), now = asciiValueInt()
        guard (97...122) ~= now else { return now }
        return roundIn26(now + gap - 97) + 97
    }
}

func encryptUnit(_ target: [Character], key: Int) -> [Character] {
    precondition(target.count == 2)
    let x = target[0].asciiValueInt()
    let d = x - 96
    let y = target[1].rotateLCA(by: d + key)
    return [y, x].map({ Character(UnicodeScalar($0)!)})
}

func decryptUnit(_ target: [Character], key: Int) -> [Character] {
    precondition(target.count == 2)
    let y = target[1].asciiValueInt()
    let d = y - 96
    let x = target[0].rotateLCA(by: -(d + key))
    return [y, x].map({ Character(UnicodeScalar($0)!)})
}

func proc(target: String, key: Int, _ f: ([Character], Int) -> [Character]) -> String {
    precondition(target.count.isMultiple(of: 2))
    let arr = Array(target)
    return stride(from: 0, through: arr.count - 1, by: 2).map { i in
        String(f([arr[i], arr[i + 1]], key))
    }.joined()
}

print(proc(target: "algo", key: 1) { encryptUnit($0, key: $1) })
print(proc(target: "bear", key: 3) { encryptUnit($0, key: $1) })
print(proc(target: "lbua", key: 1) { decryptUnit($0, key: $1) })
print(proc(target: "pdkc", key: 3) { decryptUnit($0, key: $1) })
