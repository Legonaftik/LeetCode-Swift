class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var answer: [[Int]] = []
        var permutation = nums
        func generatePermutations(startIndex: Int) {
            if startIndex < permutation.endIndex {
                for swapIndex in startIndex..<permutation.endIndex {
                    permutation.swapAt(startIndex, swapIndex)
                    generatePermutations(startIndex: startIndex + 1)
                    permutation.swapAt(startIndex, swapIndex)
                }
            } else {
                answer.append(permutation)
            }
        }
        generatePermutations(startIndex: 0)
        return answer
    }
}
