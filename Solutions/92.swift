class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == right { return head }

        var pre: ListNode?
        var start: ListNode!
        var end: ListNode!
        var post: ListNode?

        var current = head
        for index in 1..<right {
            switch index {
            case left-1:
                pre = current
            case left:
                start = current
            default: ()
            }
            current = current?.next
        }
        end = current
        post = current?.next

        current = start
        var next = current?.next
        for _ in left..<right {
            let nextNext = next?.next
            next?.next = current
            current = next
            next = nextNext
        }
        pre?.next = end
        start.next = post
        return left == 1 ? end : head
    }
}
