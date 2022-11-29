class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var uniquePermutations: [[Int]] = []
        var permutation: [Int] = []
        permutation.reserveCapacity(nums.count)

        var counters: [Int: Int] = [:]
        for num in nums {
            counters[num, default: 0] += 1
        }

        func backtrack() {
            if permutation.count == nums.count {
                uniquePermutations.append(permutation)
            } else {
                for (num, counter) in counters {
                    // We've already used all the instances of this num
                    if counter == 0 { continue }

                    permutation.append(num)
                    counters[num] = counter-1
                    backtrack()
                    permutation.removeLast()
                    counters[num] = counter
                }
            }
        }

        backtrack()
        return uniquePermutations
    }
}
