class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var diff: [Character: Int] = [:]
        for char in t {
            diff[char, default: 0] += 1
        }
        let diffKeys = Set(diff.keys)
        let s = Array(s) // Constant time comparison of distances
        var output: (lower: Int, upper: Int)?
        var lower = 0
        for upper in s.indices {
            guard diffKeys.contains(s[upper]) else { continue }
            diff[s[upper], default: 0] -= 1
            while diff.values.allSatisfy { $0 <= 0 } {
                if output == nil || upper-lower < output!.upper-output!.lower {
                    output = (lower, upper)
                }
                if diffKeys.contains(s[lower]) {
                    diff[s[lower], default: 0] += 1
                }
                lower += 1
            }
        }
        if let output = output {
            return String(s[output.lower...output.upper])
        } else {
            return ""
        }
    }
}
