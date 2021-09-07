class Solution {

    private struct NodeInfo {
        let sum: Int
        let count: Int
    }

    func maximumAverageSubtree(_ root: TreeNode?) -> Double {
        var answer: Double = 0

        func dfs(root: TreeNode?) -> NodeInfo {
            guard let root = root else { return NodeInfo(sum: 0, count: 0) }

            let leftInfo = dfs(root: root.left)
            let rightInfo = dfs(root: root.right)
            let rootInfo = NodeInfo(
                sum: leftInfo.sum + rightInfo.sum + root.val,
                count: leftInfo.count + rightInfo.count + 1
            )
            answer = max(answer, Double(rootInfo.sum) / Double(rootInfo.count))
            return rootInfo
        }

        dfs(root: root)
        return answer
    }
}
