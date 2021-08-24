func cinAsInt() -> Int { Int(readLine()!)! }
func cinAsIntList() -> [Int] { readLine()!.split(separator:" ").map{Int($0)!} }

let N = cinAsInt()
var grid: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: N), count: N)
grid[0] = cinAsIntList()

for h in 1..<N {
    for w in h..<N {
        var buf: Int = 0
        for k in -1...1 where w - k >= 0 && w + k <= N - 1 {
            buf += grid[h - 1][w + k]
        }
        grid[h][w] = buf % 100
    }
}
print(grid[N - 1][N - 1])
