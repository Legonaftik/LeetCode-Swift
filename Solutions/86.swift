class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let preHead1 = ListNode()
        let preHead2 = ListNode()
        var tail1: ListNode? = preHead1
        var tail2: ListNode? = preHead2
        var current = head
        while current != nil {
            if current!.val < x {
                tail1?.next = current
                tail1 = current
            } else {
                tail2?.next = current
                tail2 = current
            }
            current = current!.next
        }
        tail1?.next = preHead2.next
        tail2?.next = nil
        return preHead1.next
    }
}
