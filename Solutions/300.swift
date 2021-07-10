class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count)
        for lastNumIndex in nums.indices {
            var maxPrefixLength = 0
            for prefixIndex in 0..<lastNumIndex {
                if nums[lastNumIndex] > nums[prefixIndex] {
                    maxPrefixLength = max(maxPrefixLength, dp[prefixIndex])
                }
            }
            dp[lastNumIndex] = maxPrefixLength + 1
        }
        return dp.max() ?? 0
    }
}