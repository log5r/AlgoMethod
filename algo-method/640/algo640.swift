let N = readLine()!.split(separator:" ").map{Int($0)!}[0]
var selected = [Bool](repeating: false, count: 101)
readLine()!.split(separator:" ").map{Int($0)!}.forEach { selected[$0] = true }
readLine()!.split(separator:" ").map{Int($0)!}.forEach { selected[$0] = true }
print(Array(1...N).filter({ !selected[$0] }).count)
