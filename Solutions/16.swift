class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var diff = Int.max

        for index in nums.indices {
            var lower = index + 1
            var upper = nums.endIndex - 1
            while lower < upper {
                let sum = nums[index] + nums[lower] + nums[upper]
                if abs(sum - target) < abs(diff) {
                    diff = sum - target
                }

                if sum < target {
                    lower += 1
                } else if sum > target {
                    upper -= 1
                } else {
                    return target
                }
            }
        }

        return target + diff
    }
}