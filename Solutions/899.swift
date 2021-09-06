class Solution {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        var chars = Array(s)
        if k == 1 {
            var answer = s
            for index in chars.indices {
                answer = min(
                    answer,
                    String(chars[index...] + chars[..<index])
                )
            }
            return answer
        } else {
            return String(chars.sorted())
        }
    }
}
