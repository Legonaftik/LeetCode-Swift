class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var output: [[Int]] = []
        var currentLevel: [TreeNode] = [root]
        while !currentLevel.isEmpty {
            output.append([])
            var nextLevel: [TreeNode] = []
            for node in currentLevel {
                output[output.endIndex-1].append(node.val)
                if let leftChild = node.left {
                    nextLevel.append(leftChild)
                }
                if let rightChild = node.right {
                    nextLevel.append(rightChild)
                }
            }
            currentLevel = nextLevel
        }
        return output
    }
}
