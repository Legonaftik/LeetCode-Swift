class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var output: [Int] = []
        output.append(contentsOf: postorderTraversal(root.left))
        output.append(contentsOf: postorderTraversal(root.right))
        output.append(root.val)       
        return output
    }
}
