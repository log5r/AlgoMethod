import Foundation
// draft

class Scanner {
    func cin() -> String { readLine()! }
    func cinAsList() -> [String] { readLine()!.split(separator: " ").map { String($0) } }
    func cinAsCharListString() -> [String] { Array(readLine()!).map{String($0)} }
    func cinAsCharList() -> [Character] { Array(readLine()!) }
}

class ReadAsInt {
    func cinAsInt() -> Int { Int(readLine()!)! }
    func cinAsIntList() -> [Int] { readLine()!.split(separator:" ").map{Int($0)!} }

    let (A, B) = { () -> (Int, Int) in
        let v = readLine()!.split(separator: " ").map { Int(String($0))! }
        precondition(v.count == 2)
        return (v[0], v[1])
    }()
}

class ReadAsInt64 {
    func cinAsInt() -> Int64 { Int64(readLine()!)! }
    func cinAsIntList() -> [Int64] { readLine()!.split(separator:" ").map{Int64($0)!} }
}


