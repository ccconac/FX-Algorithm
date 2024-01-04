import Foundation

func rule1(_ student: Int) -> [(Int, Int)] {
    var result: [(Int, Int)] = []
    var target = 0
    
    for r in 0..<n {
        for c in 0..<n {
            if pos[r][c] != 0 { continue }
            var cnt = 0
            
            for i in 0..<4 {
                let nr = r + dr[i]
                let nc = c + dc[i]
                
                if nr < 0 || nc < 0 || nr >= n || nc >= n { continue }
                
                if let isContain = faver[student]?.contains(pos[nr][nc]) {
                    if isContain {
                        cnt += 1
                    }
                }
            }
            
            if cnt > target {
                target = cnt
                result = [(r, c)]
            } else if cnt == target {
                result.append((r, c))
            }
        }
    }
    
    return result
}

func rule2(_ arr: [(Int, Int)]) -> [(Int, Int)] {
    var result: [(Int, Int)] = []
    var target = 0
    
    for (r, c) in arr {
        if pos[r][c] != 0 { continue }
        var cnt = 0
        
        for i in 0..<4 {
            let nr = r + dr[i]
            let nc = c + dc[i]
            
            if nr < 0 || nc < 0 || nr >= n || nc >= n { continue }
            
            if pos[nr][nc] == 0 {
                cnt += 1
            }
        }
        
        if cnt > target {
            target = cnt
            result = [(r, c)]
        } else if cnt == target {
            result.append((r, c))
        }
    }
    
    return result
}

let n = Int(readLine()!)!
var pos: [[Int]] = (0..<n).map { _ in (0..<n).map { _ in return 0 }}
var faver: [Int: [Int]] = [:]
var sequence: [Int] = []

for _ in 0..<n * n {
    let students: [Int] = readLine()!.components(separatedBy: " ").map {Int($0)!}
    faver[students[0]] = Array(students[1...])    //Array<Int>.SubSequence -> Array<Int>
    sequence.append(students[0])
}

let dr = [-1, 1, 0, 0]
let dc = [0, 0, -1, 1]

for seq in sequence {
    let result1 = rule1(seq)
    
    if result1.count == 1 {
        pos[result1[0].0][result1[0].1] = seq
    } else {
        let result2 = rule2(result1).sorted(by: { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 })
        pos[result2[0].0][result2[0].1] = seq
    }
}

var satisfaction = 0
for r in 0..<n {
    for c in 0..<n {
        var count = 0
        
        for i in 0..<4 {
            let nr = r + dr[i]
            let nc = c + dc[i]
            
            if nr < 0 || nc < 0 || nr >= n || nc >= n { continue }
            
            if let isContain = faver[pos[r][c]]?.contains(pos[nr][nc]) {
                if isContain {
                    count += 1
                }
            }
        }
        
        if [0, 1].contains(count) {
            satisfaction += count
        } else {
            satisfaction += Int(pow(10.0, Double(count - 1)))    //pow(_: Double, _: Double) -> Double
        }
    }
}

print(satisfaction)