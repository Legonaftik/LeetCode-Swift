class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }
        var leftSwapIndex: Int?
        for i in (1..<nums.endIndex).reversed() {
            if nums[i-1] < nums[i] {
                leftSwapIndex = i-1
                break
            }
        }
        guard var leftSwapIndex = leftSwapIndex else {
            nums.reverse() // Corner case: largest -> smallest permutation
            return
        }

        var rightSwapIndex = nums.endIndex - 1
        for i in (leftSwapIndex+2..<nums.endIndex) {
            if nums[leftSwapIndex] >= nums[i] {
                rightSwapIndex = i-1
                break
            }
        }
        nums.swapAt(leftSwapIndex, rightSwapIndex)

        // nums[leftSwapIndex...] is in non-ascending order at this point
        leftSwapIndex += 1
        rightSwapIndex = nums.endIndex - 1
        while leftSwapIndex < rightSwapIndex {
            nums.swapAt(leftSwapIndex, rightSwapIndex)
            leftSwapIndex += 1
            rightSwapIndex -= 1
        }
    }
}
