class Solution {
    func grayCode(_ n: Int) -> [Int] {
        let outputLength = 1 << n
        var output: [Int] = [0]
        var seen: Set<Int> = [0]

        func backtrack() -> Bool {
            if output.count == outputLength { return true }
            let previous = output.last!
            for bit in 0..<n {
                let next = previous ^ (1 << bit)
                if seen.contains(next) { continue }

                output.append(next)
                seen.insert(next)
                if backtrack() { return true }
                output.removeLast()
                seen.remove(next)
            }
            return false
        }

        backtrack()
        return output
    }
}
