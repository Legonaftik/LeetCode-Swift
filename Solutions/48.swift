class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for row in 0..<(n/2) {
            for col in row..<(n-row-1) {
                let oldTopLeft = matrix[row][col]
                let oldTopRight = matrix[col][n-row-1]
                let oldBottomLeft = matrix[n-col-1][row]
                let oldBottomRight = matrix[n-row-1][n-col-1]
                matrix[row][col] = oldBottomLeft
                matrix[col][n-row-1] = oldTopLeft
                matrix[n-col-1][row] = oldBottomRight
                matrix[n-row-1][n-col-1] = oldTopRight
            }
        }
    }
}
