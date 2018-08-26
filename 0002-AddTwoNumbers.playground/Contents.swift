// LeetCode: https://leetcode.com/problems/add-two-numbers/description/
// Solution: https://github.com/zhubofei/LeetCode-Swift/blob/master/0002-add-two-numbers.playground/Contents.swift

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1, let l2 = l2 else {
            fatalError()
        }
        if l1.next == nil, l2.next == nil {
            let node = ListNode((l1.val + l2.val) % 10)
            if l1.val + l2.val >= 10 {
                node.next = ListNode(1)
            }
            return node
        }
        var node1: ListNode? = l1
        var node2: ListNode? = l2
        var temp = ListNode((l1.val + l2.val) % 10)
        let head = temp
        var shouldAdd: Bool = ((l1.val + l2.val) / 10) > 0
        
        while nil != node1?.next || nil != node2?.next || shouldAdd {
            var val1 = 0
            var val2 = 0
            if let node = node1?.next {
                val1 = node.val
                node1 = node
            }
            
            if let node = node2?.next {
                val2 = node.val
                node2 = node
            }
            
            let newValue = (val1 + val2 + (shouldAdd ? 1 : 0)) % 10
            shouldAdd = (val1 + val2) + (shouldAdd ? 1 : 0) >= 10
            
            temp.next = ListNode(newValue)
            temp = temp.next! 
        }
        return head
    }
}
