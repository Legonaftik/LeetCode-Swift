class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var lower = 0
        var upper = nums.endIndex - 1
        while lower < upper {
            let mid = lower + (upper - lower) / 2
            if nums[mid] < nums[mid + 1] {
                lower = mid + 1 
            } else {
                upper = mid
            }
        }
        return lower
    }
}
