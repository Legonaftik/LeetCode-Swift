class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var nextOdd = head
        var nextEven = nextOdd?.next
        let oddHead = nextOdd
        let evenHead = nextEven

        while let odd = nextOdd, let even = nextEven {
            odd.next = even.next
            even.next = odd.next?.next
            if odd.next != nil { // Avoids the corner case when the two lists are not connected in the end
                nextOdd = odd.next
            }
            nextEven = even.next
        }

        nextOdd?.next = evenHead
        return oddHead
    }
}
