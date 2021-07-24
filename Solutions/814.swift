class Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        root.left = pruneTree(root.left)
        root.right = pruneTree(root.right)

        if root.left == nil && root.right == nil && root.val == 0 {
            return nil
        } else {
            return root
        }
    }
}
