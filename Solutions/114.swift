class Solution {
    func flatten(_ root: TreeNode?) {
        flattenAndReturnTail(root)
    }

    /// Returns the last node in the Linked List formed by `root`
    private func flattenAndReturnTail(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let leftTail = flattenAndReturnTail(root.left)
        let rightTail = flattenAndReturnTail(root.right)
        if let leftTail = leftTail {
            leftTail.right = root.right
            root.right = root.left
            root.left = nil
        }
        return rightTail ?? leftTail ?? root
    }
}
