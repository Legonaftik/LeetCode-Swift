class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let preHead = ListNode()
        var nextUnsorted = head
        while let firstUnsorted = nextUnsorted {
            var previous = preHead            
            while previous.next != nil && previous.next!.val < firstUnsorted.val {
                previous = previous.next!
            }

            nextUnsorted = firstUnsorted.next
            firstUnsorted.next = previous.next
            previous.next = firstUnsorted
        }
        return preHead.next
    }
}
