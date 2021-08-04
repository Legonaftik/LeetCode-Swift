class Solution {

    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var answer: [[Int]] = []
        var currentPath: [Int] = []
        var currentSum = 0

        func dfs(node: TreeNode?) {
            guard let node = node else { return }
            currentPath.append(node.val)
            currentSum += node.val
            defer {
                currentPath.removeLast()
                currentSum -= node.val
            }
            if currentSum == targetSum && isLeaf(node: node) {
                answer.append(currentPath)
            } else {
                dfs(node: node.left)
                dfs(node: node.right)
            }
        }

        dfs(node: root)
        return answer
    }
    
    private func isLeaf(node: TreeNode) -> Bool {
        return node.left == nil && node.right == nil
    }
}
