class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var output = Int.min
        func maxWithOneChild(root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            let maxLeft = max(0, maxWithOneChild(root: root.left))
            let maxRight = max(0, maxWithOneChild(root: root.right))
            output = max(
                output,
                maxLeft + root.val + maxRight
            )
            return max(maxLeft, maxRight) + root.val
        }
        maxWithOneChild(root: root)
        return output
    }
}
