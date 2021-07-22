class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        let chars = ["L"] + Array(dominoes) + ["R"]
        var answer: [Character] = []
        var start = 0

        for end in 1..<chars.endIndex {
            if chars[end] == "." { continue }
            if start > 0 {
                answer.append(chars[start])
            }

            let charsBetween = end - start - 1
            if chars[start] == chars[end] {
                for _ in 0..<charsBetween {
                    answer.append(chars[start])
                }
            } else if chars[start] == "L" && chars[end] == "R" {
                for _ in 0..<charsBetween {
                    answer += "."
                }
            } else {
                for _ in 0..<(charsBetween/2) {
                    answer += "R"
                }
                if charsBetween % 2 == 1 {
                    answer += "."
                }
                for _ in 0..<(charsBetween/2) {
                    answer += "L"
                }
            }
            start = end
        }

        return String(answer)
    }
}
