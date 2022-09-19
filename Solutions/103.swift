class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var answer: [[Int]] = []
        var currentQueue: [TreeNode] = [root]
        var isLeftToRight = true

        while !currentQueue.isEmpty {
            var currentLevelValues: [Int] = []
            var nextQueue: [TreeNode] = []
            for node in currentQueue {
                currentLevelValues.append(node.val)
                if isLeftToRight {
                    if let leftChild = node.left {
                        nextQueue.append(leftChild)
                    }
                    if let rightChild = node.right {
                        nextQueue.append(rightChild)
                    }
                } else {
                    if let rightChild = node.right {
                        nextQueue.append(rightChild)
                    }
                    if let leftChild = node.left {
                        nextQueue.append(leftChild)
                    }
                }
            }
            answer.append(currentLevelValues)
            currentQueue = nextQueue.reversed()
            isLeftToRight.toggle()
        }

        return answer
    }
}
