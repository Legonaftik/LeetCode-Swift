class Solution {
    func recoverTree(_ root: TreeNode?) {
        var nodes: [TreeNode] = []
        func traverse(node: TreeNode?) {
            guard let node = node else { return }
            traverse(node: node.left)
            nodes.append(node)
            traverse(node: node.right)
        }
        traverse(node: root)

        guard nodes.count >= 2 else { return }

        var first: TreeNode?
        var second: TreeNode?
        for index in 0...(nodes.endIndex-2) {
            if nodes[index].val <= nodes[index+1].val { continue }
            second = nodes[index+1]
            if first == nil {
                first = nodes[index] 
            } else {
                break // Found both now
            }
        }

        guard let first = first, let second = second else { return }
        let oldFirstVal = first.val
        first.val = second.val
        second.val = oldFirstVal
    }
}
