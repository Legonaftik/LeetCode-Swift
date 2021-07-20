class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard 
            let rootValue = root?.val,
            let pValue = p?.val,
            let qValue = q?.val
        else {
            return nil
        }

        if pValue < rootValue && qValue < rootValue {
            return lowestCommonAncestor(root?.left, p, q)
        } else if pValue > rootValue && qValue > rootValue {
            return lowestCommonAncestor(root?.right, p, q)
        } else {
            return root
        }
    }
}