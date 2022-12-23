class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var values: [Int] = []
        var next = head
        while let current = next {
            values.append(current.val)
            next = current.next
        }

        func buildTree(lower: Int, upper: Int) -> TreeNode? {
            guard lower <= upper else { return nil }
            let mid = lower + (upper - lower) / 2
            return TreeNode(
                values[mid],
                buildTree(lower: lower, upper: mid-1),
                buildTree(lower: mid+1, upper: upper)
            )
        }
        return buildTree(lower: values.startIndex, upper: values.endIndex-1)
    }
}
