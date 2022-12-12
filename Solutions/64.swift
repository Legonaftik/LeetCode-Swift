class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var dp = Array(
            repeating: Array(repeating: Int.max, count: grid[0].count),
            count: grid.count
        )
        dp[0][0] = grid[0][0]
        for row in 1..<grid.endIndex {
            dp[row][0] = dp[row-1][0] + grid[row][0]
        }
        for col in 1..<grid[0].endIndex {
            dp[0][col] = dp[0][col-1] + grid[0][col]
        }

        for row in 1..<grid.endIndex {
            for col in 1..<grid[0].endIndex {
                dp[row][col] = min(dp[row-1][col], dp[row][col-1]) + grid[row][col]
            }
        }
        return dp.last!.last!
    }
}
