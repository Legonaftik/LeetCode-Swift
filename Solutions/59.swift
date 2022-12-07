class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        enum Direction {
            case right, bottom, left, top
        }
        struct Cell {
            var row: Int
            var col: Int
        }
        var right = n-1
        var bottom = n-1
        var left = 0
        var top = 1
        var direction = Direction.right
        var cell = Cell(row: 0, col: 0)
        var output = Array(
            repeating: Array(repeating: 0, count: n),
            count: n
        )
        for iteration in 1...(n*n) {
            output[cell.row][cell.col] = iteration
            switch direction {
            case .right:
                if cell.col < right {
                    cell.col += 1
                } else {
                    direction = .bottom
                    cell.row += 1
                    right -= 1
                }
            case .bottom:
                if cell.row < bottom {
                    cell.row += 1
                } else {
                    direction = .left
                    cell.col -= 1
                    bottom -= 1
                }
            case .left:
                if cell.col > left {
                    cell.col -= 1
                } else {
                    direction = .top
                    cell.row -= 1
                    left += 1
                }
            case .top:
                if cell.row > top {
                    cell.row -= 1
                } else {
                    direction = .right
                    cell.col += 1
                    top += 1
                }
            }
        }
        return output
    }
}
