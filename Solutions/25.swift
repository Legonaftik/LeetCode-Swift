class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let oldHead = head
        var length = 0
        var startOfNextGroup = oldHead
        while length < k && startOfNextGroup != nil {
            startOfNextGroup = startOfNextGroup?.next
            length += 1
        }
        
        if length == k {
            let newHead = reverseList(head: oldHead, length: k)
            oldHead?.next = reverseKGroup(startOfNextGroup, k)
            return newHead
        } else {
            return oldHead
        }
    }
    
    private func reverseList(head: ListNode?, length: Int) -> ListNode? {
        var newHead: ListNode?
        var current = head
        for _ in 0..<length {
            let nextNode = current?.next
            current?.next = newHead
            newHead = current
            current = nextNode
        }
        return newHead
    }
}