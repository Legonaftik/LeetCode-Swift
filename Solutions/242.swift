class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        func stringToCounters(string: String) -> [Character: Int] {
            var counters: [Character: Int] = [:]
            for char in string {
                counters[char, default: 0] += 1
            }
            return counters
        }

        return stringToCounters(string: s) == stringToCounters(string: t)
    }
}
