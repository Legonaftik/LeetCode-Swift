class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack: [TreeNode] = []
        var current = root
        var counter = 1
        while true {
            while current != nil {
                stack.append(current!)
                current = current!.left
            }
            current = stack.removeLast()
            if counter == k {
                return current!.val
            }
            counter += 1
            current = current!.right
        }
    }
}
