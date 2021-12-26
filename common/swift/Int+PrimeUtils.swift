extension Int {
    
    func isPrime() -> Bool {
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

    func primeFactors() -> [Int: Int] {
        precondition(self >= 1)
        var result = [Int: Int]()
        var n = self
        var i = 2
        while i * i <= n {
            if n.isMultiple(of: i) {
                while n.isMultiple(of: i) {
                    n /= i
                    result[i, default: 0] += 1
                }
            }
            i += 1
        }
        if n > 1 { result[n] = 1 }
        return result
    }

}

// functions depends on ext

func primes(upTo max: Int) -> [Int] {
    guard max >= 2 else { return [] }
    return [2] + stride(from: 3, through: max, by: 2).filter({ $0.isPrime() })
}
