class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indexToNum: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            let complement = target - num
            if let complementIndex = indexToNum[complement] {
                return [complementIndex, index]
            } else {
                indexToNum[num] = index
            }
        }
        return []
    }
}
