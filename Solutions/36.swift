class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let emptyChar: Character = "."

        func areRowsValid() -> Bool {
            for row in board {
                var seen: Set<Character> = []
                for char in row {
                    if char == emptyChar { continue }
                    if seen.contains(char) {
                        return false
                    } else {
                        seen.insert(char) 
                    }
                }
            }
            return true
        }

        func areColumnsValid() -> Bool {
            for col in board[0].indices {
                var seen: Set<Character> = []
                for row in board.indices {
                    let char = board[row][col]
                    if char == emptyChar { continue }
                    if seen.contains(char) {
                        return false
                    } else {
                        seen.insert(char) 
                    }
                }
            }
            return true
        }

        func areBoxesValid() -> Bool {
            let boxSize = 3
            let offsets: [(Int, Int)] = [
                (0, 0), (3, 0), (6, 0),
                (0, 3), (3, 3), (6, 3),
                (0, 6), (3, 6), (6, 6)
            ]
            for offset in offsets {
                var seen: Set<Character> = []
                for row in 0..<boxSize {
                    for col in 0..<boxSize {
                        let char = board[row+offset.0][col+offset.1]
                        if char == emptyChar { continue }
                        if seen.contains(char) {
                            return false
                        } else {
                            seen.insert(char) 
                        }
                    }
                }
            }
            return true
        }

        return areRowsValid() && areColumnsValid() && areBoxesValid()
    }
}
