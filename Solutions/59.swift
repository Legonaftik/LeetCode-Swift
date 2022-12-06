class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var answer = Array(
            repeating: Array(repeating: 0, count: n),
            count: n
        )
        var counter = 1

        for layer in 0..<( (n+1)/2 ) {
            if n-layer >= layer {
                for column in layer..<(n-layer) {
                    answer[layer][column] = counter
                    counter += 1
                }   
            }

            if n-layer >= layer+1 {
                for row in (layer+1)..<(n-layer) {
                    answer[row][n-layer-1] = counter
                    counter += 1
                }
            }

            if n-layer-1 >= layer {
                for column in (layer..<n-layer-1).reversed() {
                    answer[n-layer-1][column] = counter
                    counter += 1
                }                
            }

            if n-layer-1 >= layer+1 {
                for row in ( (layer+1)..<(n-layer-1) ).reversed() {
                    answer[row][layer] = counter
                    counter += 1
                }   
            }
        }

        return answer
    }
}
