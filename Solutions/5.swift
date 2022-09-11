class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var answerLower = 0
        var answerUpper = 0

        for center in chars.indices {
            for upperOffset in 0...1 {
                var lower = center
                var upper = center + upperOffset
                while lower >= chars.startIndex && upper < chars.endIndex && chars[lower] == chars[upper] {
                    if (upper - lower) > (answerUpper - answerLower) {
                        answerLower = lower
                        answerUpper = upper
                    }
                    lower -= 1
                    upper += 1
                }
            }
        }

        return String(chars[answerLower...answerUpper])
    }
}
