class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else { return false }

        var smallestBefore = Array(repeating: Int.max, count: nums.count)
        smallestBefore[0] = nums[0]
        for index in 1..<nums.endIndex {
            smallestBefore[index] = min(
                smallestBefore[index-1],
                nums[index-1]
            )
        }

        var largestAfter = Array(repeating: Int.min, count: nums.count)
        largestAfter[nums.endIndex-1] = nums.last!
        for index in (0...(nums.endIndex-2)).reversed() {
            largestAfter[index] = max(
                largestAfter[index+1],
                nums[index+1]
            )
        }

        for center in nums.indices {
            if smallestBefore[center] < nums[center] && nums[center] < largestAfter[center] {
                return true
            }
        }
        return false
    }
}
