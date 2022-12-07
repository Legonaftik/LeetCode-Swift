class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var factorials: [Int] = [1]
        var nums: [Int] = [1]
        for i in 1..<n {
            factorials.append(factorials[i-1] * i)
            nums.append(i + 1)
        }

        var k = k - 1 // fit k in the interval 0 ... (n! - 1)
        var output = ""
        for i in (0..<n).reversed() {
            let idx = k / factorials[i]
            k -= idx * factorials[i]
            
            output += String(nums[idx])
            nums.remove(at: idx)
        }
        return output
    }
}
