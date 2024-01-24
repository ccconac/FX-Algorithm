import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var reached = Array(repeating: 0, count: N + 1), failedClear = Array(repeating: 0, count: N + 1)
    
    for stage in stages {
        if stage == N + 1 {
            for i in 1..<stage {
                reached[i] += 1
            }
        } else {
            for i in 1...stage {
                reached[i] += 1
            }
            
            failedClear[stage] += 1
        }
    }
    
    let failureRate: [(rate: Double, idx: Int)] = (1...N).map { idx in
        if reached[idx] == 0 {
            return (0.0, idx)
        } else {
            return (Double(failedClear[idx]) / Double(reached[idx]), idx)
        }
    }
    let answer = failureRate.sorted(by: { $0.rate > $1.rate }).map { $0.idx }
    
    return answer
}