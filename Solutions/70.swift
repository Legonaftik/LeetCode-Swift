class Solution {
    private var memo: [Int: Int] = [0: 1, 1: 1]

    func climbStairs(_ n: Int) -> Int {
        if let cachedValue = memo[n] {
            return cachedValue
        } else {
            let output = climbStairs(n-1) + climbStairs(n-2)
            memo[n] = output
            return output
        }
    }
}
