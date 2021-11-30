class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var start = 0
        var end = 0
        for center in chars.indices {
            let length1 = palindromeLength(chars: chars, leftCenter: center, rightCenter: center)
            let length2 = palindromeLength(chars: chars, leftCenter: center, rightCenter: center+1)
            let maxLength = max(length1, length2)
            if maxLength > end - start {
                start = center - (maxLength - 1) / 2
                end = center + maxLength / 2
            }
        }
        return String(chars[start...end])
    }

    private func palindromeLength(
        chars: [Character],
        leftCenter: Int,
        rightCenter: Int
    ) -> Int {
        var leftCenter = leftCenter
        var rightCenter = rightCenter
        while leftCenter >= 0 && rightCenter < chars.endIndex && chars[leftCenter] == chars[rightCenter] {
            leftCenter -= 1
            rightCenter += 1
        }
        return rightCenter - leftCenter - 1
    }
}
