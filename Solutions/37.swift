class Solution {

    func solveSudoku(_ board: inout [[Character]]) {
        let size = board.count

        func canPutNum(_ num: Character, row: Int, col: Int) -> Bool {
            let boxSize = 3
            for offset in 0..<size {
                if board[row][offset] == num || board[offset][col] == num {
                    return false
                }
                let boxRow = row / boxSize * boxSize + offset / boxSize
                let boxCol = col / boxSize * boxSize + offset % boxSize
                if board[boxRow][boxCol] == num {
                    return false
                }            
            }
            return true
        }

        func solve() -> Bool {
            for row in 0..<size {
                for col in 0..<size {
                    guard board[row][col] == "." else { continue }
                    for num in "123456789" {
                        guard canPutNum(num, row: row, col: col) else { continue }
                        board[row][col] = num
                        if solve() {
                            return true
                        }
                        board[row][col] = "."
                    }
                    return false
                }
            }
            return true
        }

        solve()
    }
}
