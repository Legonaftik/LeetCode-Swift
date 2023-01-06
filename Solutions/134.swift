class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalTank = 0
        var currentTank = 0
        var start = 0
        for i in gas.indices {
            let diff = gas[i] - cost[i]
            totalTank += diff
            currentTank += diff
            if currentTank < 0 {
                currentTank = 0
                start = i + 1
            }
        }
        if totalTank >= 0 {
            return start
        } else {
            return -1   
        }
    }
}
