func cinAsIntList() -> [Int] { readLine()!.split(separator:" ").map{Int($0)!} }

let NM = cinAsIntList()
let (N, M) = (NM[0], NM[1])
let D = cinAsIntList()

var cells: [Bool] = Array.init(repeating: false, count: N + 1)
cells[0] = true

for i in 1...N {
    for d in D where i - d >= 0 && cells[i - d] {
        cells[i] = true
    }
}

print(cells[N] ? "Yes" : "No")
