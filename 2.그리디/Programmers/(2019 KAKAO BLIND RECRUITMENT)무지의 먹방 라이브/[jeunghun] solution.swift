import Foundation

func solution(_ food_times: [Int], _ k: Int64) -> Int {
    let total = food_times.reduce(0) { $0 + $1 }
    
    if total <= k { return -1 }
    
    var length = food_times.count
    var arr: [(Int, Int)] = []
    for i in 0..<length {
        arr.append((food_times[i], i + 1))
    }
    
    var sortedArr = arr.sorted { $0.0 < $1.0 }
    var i = 0
    var previous = 0
    var sumTimes = 0
    
    while sumTimes + (sortedArr[i].0 - previous) * length <= Int(k) {
        let now = sortedArr[i].0
        sumTimes += (now - previous) * length
        previous = now
        length -= 1
        i += 1
    }
    
    sortedArr = sortedArr[i...].sorted { $0.1 < $1.1 }
    return sortedArr[(Int(k) - sumTimes) % length].1
}