class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        var currentSum = 0
        func hasPathSum(_ root: TreeNode?) -> Bool {
            guard let root = root else { return false }
            currentSum += root.val
            defer { currentSum -= root.val }
            if currentSum == targetSum && root.isLeaf { return true }
            return hasPathSum(root.left) || hasPathSum(root.right)
        }
        return hasPathSum(root)
    }
}

extension TreeNode {
    var isLeaf: Bool {
        return left == nil && right == nil
    }
}
