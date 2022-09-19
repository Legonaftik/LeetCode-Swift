class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderIndices: [Int: Int] = [:]
        for (index, num) in inorder.enumerated() {
            inorderIndices[num] = index
        }

        var preorderIndex = 0
        func arraysToTree(inorderLower: Int, inorderUpper: Int) -> TreeNode? {
            guard preorderIndex < preorder.endIndex && inorderLower <= inorderUpper else { return nil }
            let preorderVal = preorder[preorderIndex]
            preorderIndex += 1

            let root = TreeNode(preorderVal)
            let inorderIndex = inorderIndices[preorderVal]!
            root.left = arraysToTree(
                inorderLower: inorderLower,
                inorderUpper: inorderIndex - 1
            )
            root.right = arraysToTree(
                inorderLower: inorderIndex + 1,
                inorderUpper: inorderUpper
            )
            return root
        }

        return arraysToTree(
            inorderLower: 0,
            inorderUpper: inorder.endIndex - 1
        )
    }
}
