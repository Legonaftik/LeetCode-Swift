class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rowsToNullify: Set<Int> = []
        var colsToNullify: Set<Int> = []
        for row in matrix.indices {
            for col in matrix[0].indices {
                if matrix[row][col] == 0 {
                    rowsToNullify.insert(row)
                    colsToNullify.insert(col)
                }
            }
        }
        for row in rowsToNullify {
            for col in matrix[0].indices {
                matrix[row][col] = 0
            }
        }
        for col in colsToNullify {
            for row in matrix.indices {
                matrix[row][col] = 0
            }
        }
    }
}
