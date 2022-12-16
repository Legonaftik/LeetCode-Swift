final class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var lower = nums.startIndex
        var upper = nums.endIndex - 1

        func isInFirstArray(num: Int) -> Bool {
            return nums[lower] <= num
        }

        while lower <= upper {
            let midIndex = lower + (upper - lower) / 2
            let midNum = nums[midIndex]
            if midNum == target {
                return true
            }
            if midNum == nums[lower] {
                lower += 1
                continue
            }

            switch (isInFirstArray(num: midNum), isInFirstArray(num: target)) {
            case (true, false):
                lower = midIndex + 1
            case (false, true):
                upper = midIndex - 1
            case (true, true), (false, false):
                if target < midNum {
                    upper = midIndex - 1
                } else {
                    lower = midIndex + 1
                }
            }           
        }
        return false
    }
}
