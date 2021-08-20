class Solution {
    func maxProduct(_ root: TreeNode?) -> Int {
        var subtreeSums: [Int] = []

        func calculateSum(root: TreeNode?) -> Int {
            guard let node = root else { return 0 }
            let sum = node.val + calculateSum(root: node.left) + calculateSum(root: node.right)
            subtreeSums.append(sum)
            return sum
        }

        let totalSum = calculateSum(root: root)
        var answer = 0
        for subtreeSum in subtreeSums {
            answer = max(
                answer,
                subtreeSum * (totalSum - subtreeSum)
            )
        }
        return answer % Int(1E9+7)
    }
}
