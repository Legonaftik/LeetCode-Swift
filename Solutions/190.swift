class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var answer = 0
        for _ in 0..<32 {
            let bit = n % 2
            n /= 2
            answer *= 2
            answer += bit
        }
        return answer
    }
}
