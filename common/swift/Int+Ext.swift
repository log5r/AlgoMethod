import Foundation

extension Int {
    func sqrtFloor() -> Int {
        Int(Double(self).squareRoot())
    }
}
