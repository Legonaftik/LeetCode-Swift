class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var prefixSum = 0
        var minSum = 0
        var answer = Int.min
        for num in nums {
            prefixSum += num
            answer = max(answer, prefixSum - minSum)
            minSum = min(minSum, prefixSum)
        }
        return answer
    }
}
