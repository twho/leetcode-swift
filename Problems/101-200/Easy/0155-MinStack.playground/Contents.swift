// LeetCode: https://leetcode.com/problems/min-stack/

import XCTest

struct StackElement {
    var val: Int
    var minVal: Int
    
    init(_ val: Int, _ minVal: Int) {
        self.val = val
        self.minVal = minVal
    }
}

class MinStack {
    var arr: [StackElement]
    
    /** initialize your data structure here. */
    init() {
        arr = [StackElement]()
    }
    
    func push(_ x: Int) {
        let min = getMin()
        var element = StackElement(x, min)
        if x < min {
            element = StackElement(x, x)
        }
        arr.append(element)
    }
    
    func pop() {
        if arr.isEmpty {
            return
        }
        arr.removeLast()
    }
    
    func top() -> Int {
        return arr.last!.val
    }
    
    func getMin() -> Int {
        if let val = arr.last?.minVal {
            return val
        }
        return Int.max
    }
}
