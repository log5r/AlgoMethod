extension Int {
    func isPrime() -> Bool {
        guard self != 2 else { return true }
        guard self >= 3 else { return false }
        guard self & 1 == 1 else { return false }
        var i = 3
        while i * i <= self {
            if self % i == 0 { return false }
            i += 2
        }
        return true
    }
}

// functions depends on ext

func primes(upTo max: Int) -> [Int] {
    guard max >= 2 else { return [] }
    return [2] + stride(from: 3, through: max, by: 2).filter({ $0.isPrime() })
}
