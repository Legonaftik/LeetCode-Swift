class Solution {
    func ladderLength(
        _ beginWord: String,
        _ endWord: String,
        _ wordList: [String]
    ) -> Int {
        var matchingWords: [Substring: [String]] = [:]
        for word in wordList {
            for i in word.indices {
                let regexWord = self.regexWord(word, starIndex: i)
                matchingWords[regexWord, default: []].append(word)
            }
        }

        var queue: [String] = [beginWord]
        var visited: Set<String> = [beginWord]
        var length = 0

        while !queue.isEmpty {
            length += 1
            var nextQueue: [String] = []
            for word in queue {
                for i in word.indices {
                    let regexWord = self.regexWord(word, starIndex: i)
                    for neighbor in matchingWords[regexWord, default: []] {
                        if neighbor == endWord {
                            return length + 1
                        }
                        if !visited.contains(neighbor) {
                            visited.insert(neighbor)
                            nextQueue.append(neighbor)
                        }
                    }
                }
            }
            queue = nextQueue
        }

        return 0
    }
    
    private func regexWord(_ word: String, starIndex: String.Index) -> Substring {
        return word[..<starIndex] + "*" + word[word.index(after: starIndex)...] 
    }
}
