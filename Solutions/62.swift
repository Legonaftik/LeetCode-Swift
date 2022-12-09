class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 1, n > 1 else { return 1 }

        var dp = Array(
            repeating: Array(repeating: 1, count: n),
            count: m
        )
        for row in 1..<dp.endIndex {
            for col in 1..<dp[0].endIndex {
                dp[row][col] = dp[row-1][col] + dp[row][col-1]
            }
        }
        return dp[m-1][n-1]
    }
}
