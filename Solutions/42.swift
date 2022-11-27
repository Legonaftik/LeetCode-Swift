class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.count < 3 { return 0 }

        var lower = height.startIndex
        var upper = height.endIndex - 1
        var maxBefore = 0
        var maxAfter = 0
        var answer = 0
        while lower < upper {
            if height[lower] < height[upper] {
                if height[lower] > maxBefore {
                    maxBefore = height[lower]
                } else {
                    answer += maxBefore - height[lower]
                }
                lower += 1
            } else {
                if height[upper] > maxAfter {
                    maxAfter = height[upper]
                } else {
                    answer += maxAfter - height[upper]
                }
                upper -= 1
            }
        }
        return answer
    }
}
