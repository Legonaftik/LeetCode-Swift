class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var answer = 0
        var leftIndex = 0
        var rightIndex = height.endIndex - 1
        while leftIndex < rightIndex {
            let currentArea = min(height[leftIndex], height[rightIndex]) * (rightIndex - leftIndex)
            answer = max(answer, currentArea)
            if height[leftIndex] < height[rightIndex] {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }
        }
        return answer
    }
}
