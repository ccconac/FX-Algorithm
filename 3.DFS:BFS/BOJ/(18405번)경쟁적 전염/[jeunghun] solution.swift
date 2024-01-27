import Foundation

let input1 = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = input1[0], k = input1[1]
var board = [[Int]]()
var viruses = [(Int, Int, Int, Int)]()

for i in 0..<n {
    let examiner = readLine()!.components(separatedBy: " ").map { Int($0)! }
    for j in 0..<n {
        if examiner[j] != 0 {
            viruses.append((examiner[j], i, j, 0))
        }
    }
    
    board.append(examiner)
}

let input2 = readLine()!.components(separatedBy: " ").map { Int($0)! }
let s = input2[0], x = input2[1], y = input2[2]
let di = [-1, 1, 0, 0]    //상, 하, 좌, 우
let dj = [0, 0, -1, 1]    //상, 하, 좌, 우
var queue = viruses.sorted(by: { $0.0 < $1.0 })

while !queue.isEmpty {
    let (v, i, j, t) = queue.removeFirst()
    
    for k in 0..<4 {
        let ni = i + di[k]
        let nj = j + dj[k]
        
        if ni < 0 || nj < 0 || ni >= n || nj >= n || t == s { continue }
        
        if board[ni][nj] == 0 {
            board[ni][nj] = v
            queue.append((v, ni, nj, t + 1))
        }
    }
}

print(board[x - 1][y - 1])