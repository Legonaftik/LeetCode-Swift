class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var output = Array(
            repeating: [1],
            count: numRows
        )
        for row in 1..<numRows {
            for col in 1...row {
                let topLeft = output[row-1][col-1]
                let topRight = col < row ? output[row-1][col] : 0
                output[row].append(topLeft + topRight)
            }
        }
        return output
    }
}
