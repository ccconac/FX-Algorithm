import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int {
    var total: Int = 0
    
    for i in 1...count {
        total += price * i
    }
    
    if total > money {
        return total - money
    } else {
        return 0
    }
}