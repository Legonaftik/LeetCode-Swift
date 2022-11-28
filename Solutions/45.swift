class Solution {
    func jump(_ nums: [Int]) -> Int {
        var jumps = 0
        var currentJumpMaxIndex = 0
        var nextJumpMaxIndex = 0
        for i in nums.startIndex..<(nums.endIndex-1) {
            nextJumpMaxIndex = max(nextJumpMaxIndex, i + nums[i])
            if i == currentJumpMaxIndex {
                currentJumpMaxIndex = nextJumpMaxIndex
                jumps += 1
            }
        }
        return jumps
    }
}
