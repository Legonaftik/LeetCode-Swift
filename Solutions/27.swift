class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var insertionIndex = 0
        for num in nums {
            if num == val { continue }
            nums[insertionIndex] = num
            insertionIndex += 1
        }
        return insertionIndex
    }
}
