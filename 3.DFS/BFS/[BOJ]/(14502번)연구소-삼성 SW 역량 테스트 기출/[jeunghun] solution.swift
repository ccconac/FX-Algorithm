import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = input[0], m = input[1]
var lab = [[Int]]()
var empities = [(Int, Int)]()

for i in 0..<n {
    let data = readLine()!.components(separatedBy: " ").map { Int($0)! }
    for j in 0..<m {
        if data[j] == 0 {
            empities.append((i, j))
        }
    }
    
    lab.append(data)
}

var candidates = [[(Int, Int)]]()

for i in 0..<empities.count-2 {
    for j in i+1..<empities.count-1 {
        for k in j+1..<empities.count {
            candidates.append([empities[i], empities[j], empities[k]])
        }
    }
}

let dx = [-1, 1, 0, 0]    //상, 하, 좌, 우
let dy = [0, 0, -1, 1]    //상, 하, 좌, 우
var result = 0

for candidate in candidates {
    var board = lab
    for (x, y) in candidate {
        board[x][y] = 1    //벽 세우기
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == 2 {
                //BFS
                var q = [(i, j)]
                while !q.isEmpty {
                    let (x, y) = q.removeFirst()
                    
                    for t in 0..<4 {
                        let nx = x + dx[t]
                        let ny = y + dy[t]
                        
                        if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
                        
                        if board[nx][ny] == 0 {
                            q.append((nx, ny))
                            board[nx][ny] = 2
                        }
                    }
                }
            }
        }
    }
    
    var tmp = 0
    for i in 0..<n {
        tmp += board[i].filter { $0 == 0 }.count
    }
    
    if result < tmp {
        result = tmp
    }
}

print(result)
