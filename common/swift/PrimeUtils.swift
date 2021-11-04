import Foundation

// <T: BinaryInteger> はめんどくさくてやってない...

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

func divisor(of n: Int) -> [Int] {
    var res: [Int] = []
    for i in 1..<(n.sqrtFloor() + 1) where n % i == 0 {
        res.append(i)
        if i * i != n { res.append(n / i) }
    }
    return res
}

func primeDecomposition<T: BinaryInteger>(of n: T) -> [T] {
    guard n > 1 else { return [] }
    guard n > 2 else { return [2] }
    let uq = T(Double(n).squareRoot())
    var d: T = 1
    var q: T = n % 2 == 0 ? 2 : 3
    func step(_ x: T) -> T {
        1 + (x << 2) - ((x >> 1) << 1)
    }
    while q <= uq && n % q != 0 {
        q = step(d)
        d += 1
    }
    return q <= uq ? [q] + primeDecomposition(of: n / q) : [n]
}

