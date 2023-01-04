class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        func sumNumbers(_ root: TreeNode?, pathSum: Int) -> Int {
            guard let root = root else { return 0 }
            let pathSum = pathSum * 10 + root.val
            if root.left == nil && root.right == nil {
                return pathSum
            } else {
                return sumNumbers(root.left, pathSum: pathSum) + sumNumbers(root.right, pathSum: pathSum)
            }
        }
        return sumNumbers(root, pathSum: 0)
    }
}
