class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var lower = 0
        var upper = nums.endIndex - 1
        if nums[lower] < nums[upper] {
            return nums[lower]
        }

        while lower < upper {
            let mid = lower + (upper-lower) / 2
            if nums[mid] > nums[mid+1] {
                return nums[mid+1]
            } else if nums[mid-1] > nums[mid] {
                return nums[mid]
            }

            if nums[mid] > nums[0] {
                lower = mid + 1
            } else {
                upper = mid - 1
            }
        }

        return nums[0]
    }
}
