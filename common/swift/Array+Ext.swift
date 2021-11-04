extension Array where Element: Comparable {
    func lowerBound(of item: Element) -> Index {
        var (left, right) = (0, self.count)
        while left < right {
            let mid = (left + right) >> 1
            if self[mid] >= item { right = mid }
            else { left = mid + 1 }
        }
        return left
    }
    func upperBound(of item: Element) -> Index {
        var (left, right) = (0, self.count)
        while left < right {
            let mid = (left + right) >> 1
            if self[mid] <= item { left = mid + 1}
            else { right = mid }
        }
        return left
    }
}

extension Array where Element: Hashable {
    func groupByCount() -> [Element: Int] {
        var res: [Element: Int] = [:]
        for item in self { res[item, default: 0] += 1 }
        return res
    }
}
