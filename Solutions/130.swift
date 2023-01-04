class Solution {
    private struct Cell: Hashable {
        let row: Int
        let col: Int
    }
    private let o: Character = "O"
    private let x: Character = "X"

    func solve(_ board: inout [[Character]]) {
        var isSeen = Array(
            repeating: Array(repeating: false, count: board[0].count),
            count: board.count
        )
        for row in board.indices {
            for col in board[0].indices {
                guard board[row][col] == o, !isSeen[row][col] else { continue }
                var currentRegion: Set<Cell> = []
                var shouldCapture = true
                func buildRegion(row: Int, col: Int) {
                    guard board.indices ~= row, board[0].indices ~= col else { 
                        shouldCapture = false
                        return 
                    }
                    guard board[row][col] == o else { return }
                    let cell = Cell(row: row, col: col)
                    guard !currentRegion.contains(cell) else { return }
                    currentRegion.insert(cell)
                    isSeen[row][col] = true
                    buildRegion(row: row+1, col: col)
                    buildRegion(row: row-1, col: col)
                    buildRegion(row: row, col: col+1)
                    buildRegion(row: row, col: col-1)
                }
                buildRegion(row: row, col: col)
                if shouldCapture {
                    currentRegion.forEach { board[$0.row][$0.col] = x }
                }
            }
        }
    }
}
