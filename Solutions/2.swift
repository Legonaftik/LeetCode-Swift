class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let pseudoHead = ListNode()
        var previous = pseudoHead
        var carry = 0
        var l1 = l1
        var l2 = l2

        while l1 != nil || l2 != nil {
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = sum / 10
            let newNode = ListNode(sum % 10)
            previous.next = newNode
            previous = newNode
            l1 = l1?.next
            l2 = l2?.next
        }

        if carry > 0 {
            previous.next = ListNode(carry)
        }
        return pseudoHead.next
    }
}
