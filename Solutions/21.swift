class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2
        let preHead = ListNode()
        var tail = preHead
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                tail.next = list1
                list1 = list1?.next
            } else {
                tail.next = list2
                list2 = list2?.next
            }
            tail = tail.next!
        }
        tail.next = list1 == nil ? list2 : list1
        return preHead.next
    }
}
