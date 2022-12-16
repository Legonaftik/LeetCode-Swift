
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let preHead = ListNode()
        preHead.next = head
        var distinct = preHead
        var candidate = head
        var explorer = head
        while explorer != nil {
            while candidate!.val == explorer?.val {
                explorer = explorer!.next
            }
            if candidate!.next === explorer {
                distinct = candidate!
            } else {
                distinct.next = explorer
            }
            candidate = explorer
        }
        return preHead.next
    }
}
