class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var answer = 0
        var charToPreviousIndex: [Character: Int] = [:]
        var lower = 0
        for (upper, char) in s.enumerated() {
            if let previousIndexOfDuplicate = charToPreviousIndex[char] {
                lower = max(lower, previousIndexOfDuplicate + 1)
            }
            answer = max(answer, upper - lower + 1)
            charToPreviousIndex[char] = upper
        }
        return answer
    }
}
