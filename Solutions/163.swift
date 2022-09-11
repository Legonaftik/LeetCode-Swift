class Solution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var answer: [String] = []
        var prevNum = lower - 1

        func processNext(num: Int) {
            switch (num - prevNum) {
            case 1:
                break
            case 2:
                answer.append(String(num-1))
            default:
                answer.append("\(prevNum+1)->\(num-1)")
            }
            prevNum = num
        }

        for num in nums {
            processNext(num: num)
        }
        processNext(num: upper + 1)
        return answer
    }
}
