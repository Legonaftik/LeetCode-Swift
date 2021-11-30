class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charToLastIndex: [Character: Int] = [:]
        var answer = 0

        for (index, char) in s.enumerated() { // O(s.count)
            if let lastIndexOfDuplicate = charToLastIndex[char] {
                // O(charToLastIndex.count)
                charToLastIndex = charToLastIndex.filter { $1 > lastIndexOfDuplicate }
            }
            charToLastIndex[char] = index
            answer = max(answer, charToLastIndex.count)
        }

        return answer
    }
}
