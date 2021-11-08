let v = readLine()!.split(separator:" ").map{Int64($0)!}
let (N, K) = (v[0], v[1])

var (left, right) = (Int64(0), Int64(1 << 60))
while left < right {
    let mid: Int64 = (left + right) >> 1
    if (1...N).reduce(Int64(0), { $0 + min(mid / $1, N) }) >= K {
        right = mid
    } else { left = mid + 1 }
}
print(left)
