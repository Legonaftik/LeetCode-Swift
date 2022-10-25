class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        return kSum(k: 4, nums: nums.sorted(), target: target, startIndex: 0)
    }

    private func kSum(
        k: Int,
        nums: [Int],
        target: Int,
        startIndex: Int
    ) -> [[Int]] {
        if (startIndex >= nums.endIndex) || (nums[startIndex] * k > target) || (nums.last! * k < target) {
            return []
        }
        if k == 2 {
            return twoSum(nums: nums, target: target, startIndex: startIndex)
        }

        var answer: [[Int]] = []
        for i in startIndex..<nums.endIndex {
            if i != startIndex && nums[i] == nums[i-1] { continue }
            for group in kSum(k: k-1, nums: nums, target: target - nums[i], startIndex: i+1) {
                answer.append([nums[i]] + group)
            }
        }
        return answer
    }

    private func twoSum(
        nums: [Int],
        target: Int,
        startIndex: Int
    ) -> [[Int]] {
        var answer: [[Int]] = []
        var lower = startIndex
        var upper = nums.endIndex - 1

        while lower < upper {
            let sum = nums[lower] + nums[upper]
            if sum < target || (lower > startIndex && nums[lower] == nums[lower-1]) {
                lower += 1
            } else if sum > target || (upper < (nums.endIndex-1) && nums[upper] == nums[upper+1]) {
                upper -= 1
            } else {
                answer.append([nums[lower], nums[upper]])
                lower += 1
                upper -= 1
            }
        }

        return answer
    }
}
