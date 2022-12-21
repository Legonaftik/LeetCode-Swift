class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return areSymmetric(root?.left, root?.right)
    }

    private func areSymmetric(
        _ left: TreeNode?,
        _ right: TreeNode?
    ) -> Bool {
        if left == nil && right == nil { return true }
        return left?.val == right?.val
            && areSymmetric(left?.left, right?.right)
            && areSymmetric(left?.right, right?.left)
    }
}
