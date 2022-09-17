class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        let lengthA = lengthOfList(head: headA)
        let lengthB = lengthOfList(head: headB)

        var nodeA = headA
        var nodeB = headB

        if lengthA > lengthB {
            for _ in 0..<(lengthA-lengthB) {
                nodeA = nodeA?.next
            }
        } else if lengthB > lengthA {
            for _ in 0..<(lengthB-lengthA) {
                nodeB = nodeB?.next
            }
        }

        while nodeA != nil {
            if nodeA === nodeB {
                return nodeA
            }
            nodeA = nodeA?.next
            nodeB = nodeB?.next
        }
        return nil
    }

    private func lengthOfList(head: ListNode?) -> Int {
        var length = 0
        var nextNode = head
        while let node = nextNode {
            length += 1
            nextNode = node.next
        }
        return length  
    }
}
