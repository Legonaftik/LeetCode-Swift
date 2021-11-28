/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(
        _ l1: ListNode?,
        _ l2: ListNode?
    ) -> ListNode? {
        var pseudoHead = ListNode(-1)
        var previousNode: ListNode? = pseudoHead
        var node1 = l1
        var node2 = l2
        var carry = 0

        while node1 != nil || node2 != nil {
            let val1 = node1?.val ?? 0
            let val2 = node2?.val ?? 0
            let sum = val1 + val2 + carry
            carry = sum / 10
            let newDigit = sum % 10
            let newNode = ListNode(newDigit)
            previousNode?.next = newNode
            previousNode = newNode

            node1 = node1?.next
            node2 = node2?.next
        }

        if carry > 0 {
            previousNode?.next = ListNode(carry)
        }
        return pseudoHead.next
    }
}
