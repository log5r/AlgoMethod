import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    guard a != 0 else { return b }
    return gcd(b % a, a)
}

func phi(_ n: Int) -> Int {
    (2..<n).filter({ gcd($0, n) == 1 }).reduce(0, +)
}

func isPrime(_ n: Int) -> Bool {
    switch n {
    case let x where x < 2:
        return false
    case 2:
        return true
    default:
        return n % 2 != 0 && !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
    }
}
