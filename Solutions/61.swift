class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return nil }

        let oldHead = head
        var length = 1
        var current = head
        while current?.next != nil {
            length += 1
            current = current?.next
        }
        let k = k % length
        if k == 0 { return oldHead }

        let oldTail = current
        oldTail?.next = oldHead

        current = oldHead
        for _ in 0..<(length - k - 1) {
            current = current?.next
        }
        let newTail = current
        let newHead = newTail?.next
        newTail?.next = nil
        return newHead
    }
}
