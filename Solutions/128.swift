class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let nums = Set(nums)
        var output = 0
        for beginningOfSequence in nums {
            if nums.contains(beginningOfSequence-1) { continue } // It's not the begging of a sequence then
            var currentLength = 1
            var numToCheck = beginningOfSequence+1
            while nums.contains(numToCheck) {
                currentLength += 1
                numToCheck += 1
            }
            output = max(output, currentLength)
        }
        return output
    }
}
