class Solution {
    func reverseWords(_ s: inout [Character]) {
        func reverseChars(start: Int, end: Int) {
            var start = start
            var end = end
            while start < end {
                s.swapAt(start, end)
                start += 1
                end -= 1
            }
        }

        func reverseWords() {
            var start = 0
            var end = 1
            while start < s.endIndex {
                while end < s.endIndex && s[end] != " " {
                    end += 1
                }
                reverseChars(start: start, end: end-1)
                start = end + 1
                end = start + 1
            }
        }

        reverseChars(start: 0, end: s.endIndex-1)
        reverseWords()
    }
}