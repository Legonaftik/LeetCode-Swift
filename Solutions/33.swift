class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        func binarySearchPivotIndex() -> Int? {
            var lower = nums.startIndex
            var upper = nums.endIndex - 1
            while lower <= upper {
                let mid = lower + (upper - lower) / 2
                guard (mid+1) < nums.endIndex else { return nil }
                if nums[mid] > nums[mid+1] {
                    return mid
                } else if nums[0] <= nums[mid] { // Checking with "<=" covers the case when mid == 0
                    lower = mid + 1
                } else {
                    upper = mid - 1
                }
            }
            return nil
        }

        func binarySearchTarget(lower: Int? = nil, upper: Int? = nil) -> Int {
            var lower = lower ?? nums.startIndex
            var upper = upper ?? nums.endIndex - 1
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
            return -1
        }

        if let pivotIndex = binarySearchPivotIndex() {
            if target >= nums[0] {
                return binarySearchTarget(upper: pivotIndex)
            } else {
                return binarySearchTarget(lower: pivotIndex+1)
            }
        } else {
            return binarySearchTarget()
        }
    }
}
