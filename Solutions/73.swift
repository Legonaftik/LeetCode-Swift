class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var nullifyFirstRow = false
        for col in matrix[0].indices {
            if matrix[0][col] == 0 {
                nullifyFirstRow = true
                break
            }
        }
        var nullifyFirstCol = false
        for row in matrix.indices {
            if matrix[row][0] == 0 {
                nullifyFirstCol = true
                break
            }
        }
        
        for row in 1..<matrix.endIndex {
            for col in 1..<matrix[0].endIndex {
                if matrix[row][col] == 0 {
                    matrix[0][col] = 0
                    matrix[row][0] = 0
                }
            }
        }
        for row in 1..<matrix.endIndex {
            for col in 1..<matrix[0].endIndex {
                if matrix[0][col] == 0 || matrix[row][0] == 0 {
                    matrix[row][col] = 0
                }
            }
        }
        
        if nullifyFirstRow {
            for col in matrix[0].indices {
                matrix[0][col] = 0
            }
        }
        if nullifyFirstCol {
            for row in matrix.indices {
                matrix[row][0] = 0
            }
        }
    }
}
