class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var output: [Int] = [root.val]
        output.append(contentsOf: preorderTraversal(root.left))
        output.append(contentsOf: preorderTraversal(root.right))
        return output
    }
}
