func cinAsIntList() -> [Int] { readLine()!.split(separator:" ").map{Int($0)!} }

var grid: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: 4), count: 4)
grid[0] = cinAsIntList()

for h in 1...3 {
    for w in h...3 {
        var buf: Int = 0
        for k in -1...1 where w - k >= 0 && w + k <= 3 {
            buf += grid[h - 1][w + k]
        }
        grid[h][w] = buf
    }
}
print(grid[3][3])
