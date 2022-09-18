class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var answer: [Int] = []
        answer.append(contentsOf: inorderTraversal(root.left))
        answer.append(root.val)
        answer.append(contentsOf: inorderTraversal(root.right))
        return answer
    }
}
