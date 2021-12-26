import Foundation

extension Collection where Element: BinaryFloatingPoint {
    var sortedSelf: [Self.Element] { sorted { a, b in a < b } }
    var average: Double { isEmpty ? .zero : Double(reduce(.zero, +)) / Double(count) } // :thinking_face:
    var median: Double {
        let ceilIndex = Int(ceil(Double(count - 1) / 2.0))
        let floorIndex = Int(floor(Double(count - 1) / 2.0))
        return Double(sortedSelf[ceilIndex] + sortedSelf[floorIndex]) / 2.0
    }
    var firstQuartile: Double { Array(sortedSelf[0..<(count >> 1)]).median }
    var thirdQuartile: Double { Array(sortedSelf[((count + 1) >> 1)...]).median }
    var interquartileRange: Double { abs(thirdQuartile - firstQuartile) }
    var variance: Double {
        let avr = self.average
        return self.reduce(.zero, { $0 + pow(Double($1) - avr, 2) }) / Double(count)
    }
    var sigma: Double { sqrt(variance) }
}

