class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var previous = Int.min
        func inOrderDFS(_ root: TreeNode?) -> Bool {
            guard let root = root else { return true }
            guard inOrderDFS(root.left) else { return false }
            guard root.val > previous else { return false }
            previous = root.val
            guard inOrderDFS(root.right) else { return false }
            return true
        }
        return inOrderDFS(root)
    }
}
