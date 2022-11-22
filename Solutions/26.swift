class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var insertionIndex = 0
        for num in nums {
            if num == nums[insertionIndex] { continue }
            insertionIndex += 1
            nums[insertionIndex] = num
        }
        return insertionIndex + 1
    }
}
