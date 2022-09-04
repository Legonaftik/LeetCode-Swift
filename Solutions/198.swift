class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count >= 2 else { return nums[0] }

        var prevPrev = nums[0]
        var prev = max(nums[0], nums[1])
        for num in nums[2...] {
            let current = max(
                num + prevPrev,
                prev
            )
            prevPrev = prev
            prev = current
        }
        return prev
    }
}
