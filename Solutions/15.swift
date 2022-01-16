class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }

        let nums = nums.sorted()
        var answer: [[Int]] = []

        var previousPivotNum: Int?
        for pivot in 0..<(nums.endIndex-2) {
            if nums[pivot] > 0 {
                continue
            } else if nums[pivot] == previousPivotNum {
                continue
            } else {
                previousPivotNum = nums[pivot]
            }
            
            var lower = pivot + 1
            var higher = nums.endIndex - 1
            while lower < higher {
                let sum = nums[pivot] + nums[lower] + nums[higher]
                if sum > 0 {
                    higher -= 1
                } else if sum < 0 {
                    lower += 1
                } else {
                    answer.append([nums[pivot], nums[lower], nums[higher]])
                    higher -= 1
                    var previousLowerNum = nums[lower]
                    while lower < nums.endIndex && nums[lower] == previousLowerNum {
                        lower += 1
                    }
                }
            }
        }

        return answer
    }
}
