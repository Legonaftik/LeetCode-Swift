class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let preHead = ListNode(-1, head)
        var slow: ListNode? = preHead
        var fast: ListNode? = preHead
        for _ in 0...n {
            fast = fast?.next
        }

        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return preHead.next
    }   
}
