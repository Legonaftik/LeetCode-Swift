class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        enum Direction {
            case right, bottom, left, top
        }
        struct Cell {
            var row: Int
            var col: Int
        }
        var right = matrix[0].endIndex - 1
        var bottom = matrix.endIndex - 1
        var left = 0
        var top = 1
        var direction = Direction.right
        var cell = Cell(row: 0, col: 0)
        var output: [Int] = []
        let iterations = matrix.count * matrix[0].count
        output.reserveCapacity(iterations)

        for _ in 0..<iterations {
            output.append(matrix[cell.row][cell.col])
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
