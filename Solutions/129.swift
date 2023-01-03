class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        if let root = root {
            return subOfSubtree(node: root, interimString: String(root.val))
        } else {
            return 0
        }
    }

    private func subOfSubtree(
        node: TreeNode,
        interimString: String
    ) -> Int {
        var sumOfChildren = 0
        if let leftChild = node.left {
            sumOfChildren += subOfSubtree(
                node: leftChild,
                interimString: interimString + String(leftChild.val)
            )
        }
        if let rightChild = node.right {
            sumOfChildren += subOfSubtree(
                node: rightChild,
                interimString: interimString + String(rightChild.val)
            )
        }
        if node.left == nil && node.right == nil {
            return Int(interimString) ?? 0
        } else {
            return sumOfChildren   
        }
    }
}
