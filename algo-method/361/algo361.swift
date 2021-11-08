let NM = readLine()!.split(separator:" ").map{Int($0)!}
let (N, M) = (NM[0], NM[1])
let A = readLine()!.split(separator:" ").map{Int($0)!}.sorted()
let B = readLine()!.split(separator:" ").map{Int($0)!}.sorted()

var c = 0
for i in 0..<M where c < N && A[c] <= B[i] { c += 1 }
print(c)

