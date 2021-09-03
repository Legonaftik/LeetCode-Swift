class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return generateTrees(start: 1, end: n)
    }

    private func generateTrees(start: Int, end: Int) -> [TreeNode?] {
        var answer: [TreeNode?] = []
        if start > end {
            answer.append(nil)
            return answer
        }

        for root in start...end {
            let leftTrees = generateTrees(start: start, end: root-1)
            let rightTrees = generateTrees(start: root+1, end: end)
            for leftRoot in leftTrees {
                for rightRoot in rightTrees {
                    let rootNode = TreeNode(root)
                    rootNode.left = leftRoot
                    rootNode.right = rightRoot
                    answer.append(rootNode)
                }
            }
        }
        return answer
    }
}
