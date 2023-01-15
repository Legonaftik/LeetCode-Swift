class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        func findIntersectionNode() -> ListNode? {
            var slow = head
            var fast = head
            while fast != nil {
                slow = slow!.next
                fast = fast!.next?.next
                if slow === fast {
                    return slow
                }
            }
            return nil
        }
        guard let intersectionNode = findIntersectionNode() else { return nil }

        var fromHead = head!
        var fromIntersection = intersectionNode
        while fromHead !== fromIntersection {
            fromHead = fromHead.next!
            fromIntersection = fromIntersection.next!
        }
        return fromHead
    }
}
