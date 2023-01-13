class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil { return false }

        var slow = head
        var fast = head?.next
        while slow !== fast {
            if fast == nil { return false }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
    }
}
