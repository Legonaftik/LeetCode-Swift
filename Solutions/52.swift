class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var unavailableCols: Set<Int> = []
        var unavailableMainDiagonals: Set<Int> = []
        var unavailableAntiDiagonals: Set<Int> = []
        var solutions = 0

        func backtrack(row: Int) {
            if row >= n {
                solutions += 1
            } else {
                for col in 0..<n {
                    let mainDiagonal = row - col
                    let antiDiagonal = row + col
                    if unavailableCols.contains(col) || unavailableMainDiagonals.contains(mainDiagonal) || unavailableAntiDiagonals.contains(antiDiagonal) { continue }
                    unavailableCols.insert(col)
                    unavailableMainDiagonals.insert(mainDiagonal)
                    unavailableAntiDiagonals.insert(antiDiagonal)
                    backtrack(row: row+1)
                    unavailableCols.remove(col)
                    unavailableMainDiagonals.remove(mainDiagonal)
                    unavailableAntiDiagonals.remove(antiDiagonal)
                }
            }
        }

        backtrack(row: 0)
        return solutions
    }
}
