// LeetCode: https://leetcode.com/problems/reorder-list/description/

import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        guard head != nil else { return }
        var arr: [ListNode] = []
        var node = head
        while node != nil {
            arr.append(node!)
            node = node?.next
        }
        var idx = 0
        let count = arr.count % 2 == 0 ? arr.count/2-1 : arr.count/2
        while idx<=count {
            if arr.count % 2 != 0, idx == count {
                arr[idx].next = nil
                break
            }
            arr[idx].next = arr[arr.count-1-(idx*2)/2]
            if idx+1 <= count  {
                arr[arr.count-1-(idx*2)/2].next = arr[idx+1]
            } else {
                arr[arr.count-1-(idx*2)/2].next = nil
            }
            idx+=1
        }
    }
    
    private func printList(_ head: ListNode?) {
        guard head != nil else { return }
        var str = ""
        var node = head
        while node != nil {
            str += "\((node?.val)!)"
            node = node?.next
        }
        print(str)
    }
}

//let node5 = ListNode(5)
let node4 = ListNode(4)
//node4.next = node5
let node3 = ListNode(3)
node3.next = node4
let node2 = ListNode(2)
node2.next = node3
let node1 = ListNode(1)
node1.next = node2

let s = Solution()
s.reorderList(node1)
s.printList(node1)

