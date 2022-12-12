class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.first?.first == 0 else {
            return 0
        }

        var dp: [[Int]] = Array(
            repeating: Array(repeating: 0, count: obstacleGrid[0].count),
            count: obstacleGrid.count
        )
        dp[0][0] = 1
        for row in 1..<dp.endIndex {
            if obstacleGrid[row][0] == 0 {
                dp[row][0] = 1
            } else {
                break
            }
        }
        for column in 1..<dp[0].endIndex {
            if obstacleGrid[0][column] == 0 {
                dp[0][column] = 1
            } else {
                break
            }
        }

        for row in 1..<dp.endIndex {
            for column in 1..<dp[0].endIndex {
                if obstacleGrid[row][column] == 0 {
                    dp[row][column] = dp[row-1][column] + dp[row][column-1]
                } else {
                    dp[row][column] = 0
                }
            }
        }
        return dp.last!.last!
    }
}
