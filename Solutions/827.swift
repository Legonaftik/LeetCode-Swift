class Solution {

    private let directions: [[Int]] = [
        [-1,0],
        [0,-1],
        [0,1],
        [1,0],
    ]

    func largestIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        
        func isValid(_ row: Int, _ col: Int) -> Bool {
            return grid.indices ~= row && grid[0].indices ~= col
        }

        var colorToArea: [Int: Int] = [:]
        colorToArea[0] = 0
        var color = 2

        func dfs(_ row: Int, _ col: Int) -> Int {
            grid[row][col] = color
            var totalArea = 1
            for direction in directions {
                let nextRow = row + direction[0]
                let nextCol = col + direction[1]
                if isValid(nextRow, nextCol) && grid[nextRow][nextCol] == 1 {
                    totalArea += dfs(nextRow, nextCol)
                }
            }
            return totalArea
        }

        for row in grid.indices {
            for col in grid[0].indices where grid[row][col] == 1 {
                colorToArea[color] = dfs(row, col)
                color += 1
            }
        }
        guard var answer = colorToArea[2] else { return 1 }

        for row in grid.indices {
            for col in grid[0].indices where grid[row][col] == 0 {
                var neighborColors: Set<Int> = []
                for direction in directions {
                    let nextRow = row + direction[0]
                    let nextCol = col + direction[1]
                    if isValid(nextRow, nextCol) {
                        neighborColors.insert(grid[nextRow][nextCol])
                    }
                }
                var totalArea = 1 
                for color in neighborColors {
                    totalArea += colorToArea[color]!
                }
                answer = max(answer, totalArea)
            }
        }
        return answer
    }
}
