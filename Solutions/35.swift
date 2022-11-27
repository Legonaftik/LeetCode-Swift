class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var lower = nums.startIndex
        var upper = nums.endIndex - 1
        while lower <= upper {
            let mid = lower + (upper - lower) / 2
            if nums[mid] < target {
                lower = mid + 1
            } else if nums[mid] > target {
                upper = mid - 1
            } else {
                return mid
            }
        }
        return lower
    }
}
