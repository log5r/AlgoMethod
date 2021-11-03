import Foundation

extension Int {
    func isPrime() -> Bool {
        switch self {
        case let x where x < 2:
            return false
        case 2:
            return true
        default:
            return self % 2 != 0 && !stride(from: 3, through: Int(sqrt(Double(self))), by: 2).contains { self % $0 == 0 }
        }
    }
}


// functions depends on ext

func primes(upTo max: Int) -> [Int] {
    guard max >= 2 else { return [] }
    return [2] + stride(from: 3, through: max, by: 2).filter({ $0.isPrime() })
}
