class Solution {
    func checkEqualTree(_ root: TreeNode?) -> Bool {
        var seen: [Int: [TreeNode]] = [:]

        func calculateSum(root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            let sum = root.val + calculateSum(root: root.left) + calculateSum(root: root.right)
            seen[sum, default: []].append(root)
            return sum
        }

        let totalSum = calculateSum(root: root)
        if totalSum == 0 {
            for node in seen[0, default: []] {
                if node.val == 0 && node !== root {
                    return true
                }
            }
            return false
        } else {
            return totalSum % 2 == 0 && seen.keys.contains(totalSum / 2)
        }
    }
}
