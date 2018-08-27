// LeetCode: https://leetcode.com/problems/merge-two-sorted-lists/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if nil != l1, nil == l2 {
            return l1
        } else if nil == l1, nil != l2 {
            return l2
        }
        
        guard let l1 = l1, let l2 = l2 else {
            return nil
        }
        var head: ListNode?
        var output: ListNode?
        var list1: ListNode? = l1
        var list2: ListNode? = l2
        if (list1?.val)! < (list2?.val)! {
            head = l1
            list1 = list1?.next
        } else {
            head = l2
            list2 = list2?.next
        }
        output = head
        
        while nil != list1 || nil != list2 {
            guard nil != list1 else {
                head?.next = list2
                return output
            }
            guard nil != list2 else {
                head?.next = list1
                return output
            }
            if (list1?.val)! < (list2?.val)! {
                head?.next = list1
                list1 = list1?.next
            } else {
                head?.next = list2
                list2 = list2?.next
            }
            head = head?.next
        }
        return output
    }
}
