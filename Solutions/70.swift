class Solution {

    private var memo: [Int: Int] = [:]

    func climbStairs(_ n: Int) -> Int {
        switch n {
        case 1:
            return 1
        case 2:
            return 2
        default:
            if let cachedValue = memo[n] {
                return cachedValue
            } else {
                let answer = climbStairs(n-1) + climbStairs(n-2)
                memo[n] = answer
                return answer
            }
        }
    }
}
