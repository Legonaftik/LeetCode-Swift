class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var lower = matrix.startIndex
        var upper = matrix.endIndex - 1
        var row: Int?
        while lower <= upper {
            let mid = lower + (upper - lower) / 2
            if matrix[mid].first! > target {
                upper = mid - 1
            } else if matrix[mid].last! < target {
                lower = mid + 1
            } else {
                row = mid
                break
            }
        }
        guard let row = row else { return false }

        lower = matrix[row].startIndex
        upper = matrix[row].endIndex - 1
        while lower <= upper {
            let mid = lower + (upper - lower) / 2
            if matrix[row][mid] > target {
                upper = mid - 1
            } else if matrix[row][mid] < target {
                lower = mid + 1
            } else {
                return true
            }
        }
        return false
    }
}
