class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var counterToStrings: [[Character: Int]: [String]] = [:]
        for string in strs {
            var counter: [Character: Int] = [:]
            for char in string {
                counter[char, default: 0] += 1
            }
            counterToStrings[counter, default: []].append(string)
        }
        return Array(counterToStrings.values)
    }
}
