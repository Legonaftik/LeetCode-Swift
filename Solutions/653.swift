class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var seen: Set<Int> = []

        func find(root: TreeNode?) -> Bool {
            guard let root = root else { return false }
            if seen.contains(k - root.val) {
                return true
            }
            seen.insert(root.val)
            return find(root: root.left) || find(root: root.right)
        }
        
        return find(root: root)
    }
}
