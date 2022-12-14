class Solution {
    func sortColors(_ nums: inout [Int]) {
        var index0 = 0
        var index1 = 0
        var index2 = nums.endIndex - 1
        while index1 <= index2 {
            switch nums[index1] {
            case 0:
                nums.swapAt(index0, index1)
                index0 += 1
                index1 += 1
            case 1:
                index1 += 1
            case 2:
                nums.swapAt(index1, index2)
                index2 -= 1
            default:
                fatalError()
            }
        }
    }
}
