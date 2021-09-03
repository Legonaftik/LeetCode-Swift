class Solution {
    func arrayNesting(_ nums: [Int]) -> Int {
        var isVisited = nums.map { _ in false }
        var answer = 0

        func dfs(start: Int, count: Int) {
            if isVisited[start] { return }
            isVisited[start] = true
            answer = max(answer, count)
            dfs(start: nums[start], count: count + 1)
        }

        for index in nums.indices {
            dfs(start: index, count: 1)
        }
        return answer
    }    
}
