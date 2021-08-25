func cinAsInt() -> Int { Int(readLine()!)! }
func cinAsIntList() -> [Int] { readLine()!.split(separator:" ").map{Int($0)!} }

let N = cinAsInt()
var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: 3), count: N)

for i in 0..<N {
    let tasks = cinAsIntList()
    for t in 0...2 {
        var selectedBeforeReward = 0
        var selectedBeforeTask = -1
        if i > 0 {
            for beforeTask in 0...2 {
                guard t != beforeTask else { continue }
                if dp[i - 1][beforeTask] > selectedBeforeReward {
                    selectedBeforeReward = dp[i - 1][beforeTask]
                    selectedBeforeTask = beforeTask
                }
            }
        }
        guard selectedBeforeTask != t else { continue }
        let reward = tasks[t]
        dp[i][t] = reward + selectedBeforeReward
    }
}
print(dp[N - 1].max()!)
