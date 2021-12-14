import Foundation

extension Collection where Element: BinaryFloatingPoint {
    var average: Double { isEmpty ? .zero : Double(reduce(.zero, +)) / Double(count) } // :thinking_face:
    var variance: Double {
        let avr = self.average
        return self.reduce(.zero, { $0 + pow(Double($1) - avr, 2) }) / Double(count)
    }
    var sigma: Double { sqrt(variance) }
}
