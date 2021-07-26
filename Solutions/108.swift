class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArrayToBST(nums, lower: 0, upper: nums.endIndex-1)
    }

    private func sortedArrayToBST(_ nums: [Int], lower: Int, upper: Int) -> TreeNode? {
        if lower > upper {
            return nil
        }

        let midIndex = lower + (upper-lower) / 2
        let root = TreeNode(nums[midIndex])
        root.left = sortedArrayToBST(nums, lower: lower, upper: midIndex-1)
        root.right = sortedArrayToBST(nums, lower: midIndex+1, upper: upper)
        return root
    }
}
