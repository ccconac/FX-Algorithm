import Foundation

public struct Heap<T> {
    private var nodes: Array<T>
    private let orderCriteria: (T, T) -> Bool
    
    init(_ nodes: Array<T>, orderCriteria: @escaping (T, T) -> Bool) {
        self.nodes = nodes
        self.orderCriteria = orderCriteria
    }
    
    func count() -> Int {
        return nodes.count
    }
    
    mutating func push(_ element: T) {
        nodes.append(element)
        
        swapUp(nodes.count - 1)
    }
    
    mutating func pop() -> T? {
        swap(0, nodes.count - 1)
        
        let value = nodes.removeLast()
        swapDown(0)
        
        return value
    }
    
    mutating private func swap(_ first: Int, _ second: Int) {
        guard first < nodes.count && second < nodes.count else { return }
        
        let temp = nodes[first]
        nodes[first] = nodes[second]
        nodes[second] = temp
    }
    
    mutating private func swapUp(_ index: Int) {
        guard index < nodes.count else { return }
        var index = index
        
        while index != 0 {
            let parent = (index - 1) / 2    //index of parent node
            
            if orderCriteria(nodes[index], nodes[parent]) {
                swap(index, parent)
                index = parent
            } else {
                return
            }
        }
    }
    
    mutating private func swapDown(_ index: Int) {
        var parent = index    //parent index
        
        while true {
            let leftChildIndex = parent * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            var candidate = parent
            
            if leftChildIndex < nodes.count && orderCriteria(nodes[leftChildIndex], nodes[candidate]) {
                candidate = leftChildIndex
            }
            
            if rightChildIndex < nodes.count && orderCriteria(nodes[rightChildIndex], nodes[candidate]) {
                candidate = rightChildIndex
            }
            
            if candidate == parent {
                return
            }
            
            swap(candidate, parent)
            parent = candidate
        }
    }
}

let n = Int(readLine()!)!
var heap = Heap(Array<Int>(), orderCriteria: <)
var result = 0

for _ in 0..<n {
    heap.push(Int(readLine()!)!)
}

while heap.count() > 1 {
    let first = heap.pop()!, second = heap.pop()!
    result += (first + second)
    heap.push(first + second)
}

print(result)