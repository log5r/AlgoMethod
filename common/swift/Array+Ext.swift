extension Array where Element: Comparable {

    // 累積和っぽいなにかを求められる何か
    func cumulate(from start: Element, _ method: (Element, Element) -> Element) -> [Element] {
        guard self.count > 0 else { return []}
        var res = [Element](repeating: start, count: self.count + 1)
        for i in 0..<self.count {
            res[i + 1] = method(res[i], self[i])
        }
        return res
    }

    // C++ の lower_bound のマネ
    func lowerBound(of item: Element) -> Index {
        var (left, right) = (0, self.count)
        while left < right {
            let mid = (left + right) >> 1
            if self[mid] >= item { right = mid }
            else { left = mid + 1 }
        }
        return left
    }

    // C++ の upper_bound のマネ
    func upperBound(of item: Element) -> Index {
        var (left, right) = (0, self.count)
        while left < right {
            let mid = (left + right) >> 1
            if self[mid] <= item { left = mid + 1}
            else { right = mid }
        }
        return left
    }

    // n個ずつ塊でほしいとき用
    func chunked(by chunkSize: Int) -> [[Element]] {
        stride(from: 0, to: self.count, by: chunkSize).map { i in
            Array(self[i..<Swift.min(i + chunkSize, self.count)])
        }
    }
}

extension Array where Element: Hashable {
    func groupByCount() -> [Element: Int] {
        var res: [Element: Int] = [:]
        for item in self { res[item, default: 0] += 1 }
        return res
    }
    func reversedIndexMap() -> [Element: Int] {
        self.enumerated().reduce(into: [Element: Int]()) { (pr: inout [Element: Int], tuple: (offset: Int, element: Element)) in
            pr[tuple.element] = tuple.offset
        }
    }
}