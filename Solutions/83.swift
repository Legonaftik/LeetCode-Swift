class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var distinct = head
        while distinct?.next != nil {
            if distinct!.val == distinct!.next!.val {
                distinct!.next = distinct!.next!.next
            } else {
                distinct = distinct!.next
            }
        }
        return head
    }
}
