import Foundation

// Int+PrimeUtils.swift も参照

// <T: BinaryInteger> はめんどくさくてやってない...

func gcd(_ a: Int, _ b: Int) -> Int {
    guard a != 0 else { return b }
    return gcd(b % a, a)
}

func phi(_ n: Int) -> Int {
    (2..<n).filter({ gcd($0, n) == 1 }).reduce(0, +)
}

func isPrime(_ n: Int) -> Bool {
    guard self != 2 else { return true }
    guard self >= 3 else { return false }
    guard self & 1 == 1 else { return false }
    var i = 3
    while i * i <= self {
        if self.isMultiple(of: i) { return false }
        i += 2
    }
    return true
}

func divisor(of n: Int) -> [Int] {
    var res: [Int] = []
    for i in 1..<(Int(Double(n).squareRoot()) + 1) where n % i == 0 {
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

