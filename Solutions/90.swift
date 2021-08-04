class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {        
        var answer: [[Int]] = []
        var candidates: [Int] = []
        let nums = nums.sorted()

        func backtrack(startIndex: Int) {
            answer.append(candidates)
            for i in startIndex..<nums.endIndex {
                guard i == startIndex || nums[i] != nums[i-1] else { continue }
                candidates.append(nums[i])
                backtrack(startIndex: i+1)
                candidates.removeLast()
            }
        }

        backtrack(startIndex: 0)
        return answer
    }   
}
