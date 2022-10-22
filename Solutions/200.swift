class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var answer = 0
        for row in grid.indices {
            for column in grid[0].indices {
                if grid[row][column] == "1" {
                    answer += 1
                    nullifyNeighbors(
                        grid: &grid,
                        row: row,
                        column: column
                    )
                }
            }
        }
        return answer
    }

    private func nullifyNeighbors(
        grid: inout [[Character]],
        row: Int,
        column: Int
    ) {
        guard grid.indices.contains(row), grid[0].indices.contains(column) else { return }
        if grid[row][column] == "0" { return }
        grid[row][column] = "0"

        nullifyNeighbors(
            grid: &grid,
            row: row - 1,
            column: column
        )
        nullifyNeighbors(
            grid: &grid,
            row: row,
            column: column - 1
        )
        nullifyNeighbors(
            grid: &grid,
            row: row + 1,
            column: column
        )
        nullifyNeighbors(
            grid: &grid,
            row: row,
            column: column + 1
        )
    }
}
