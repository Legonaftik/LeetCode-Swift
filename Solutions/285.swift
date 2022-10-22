class Solution {
    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
        var successor: TreeNode? = nil
        var next: TreeNode? = root
        while let current = next {
            if current.val <= p!.val {
                next = current.right
            } else {
                successor = current
                next = current.left
            }
        }
        return successor
    }
}
