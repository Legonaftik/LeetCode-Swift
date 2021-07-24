class Solution {
    func alienOrder(_ words: [String]) -> String {
        var graph: [Character: [Character]] = [:]
        var inNodes: [Character: Int] = [:]
        for word in words {
            for char in word {
                graph[char] = []
                inNodes[char] = 0
            }
        }

        for i in 0..<(words.endIndex-1) {
            let word1 = words[i]
            let word2 = words[i+1]
            if word1.count > word2.count && word1.hasPrefix(word2) {
                return ""
            }
            for (char1, char2) in zip(word1, word2) {
                if char1 == char2 { continue }
                graph[char1]!.append(char2)
                inNodes[char2]! += 1
                break
            }
        }

        var queue = Queue<Character>()
        for char in inNodes.keys {
            if inNodes[char] == 0 {
                queue.enqueue(char)
            }
        }

        var answer = ""
        while let char = queue.dequeue() {
            answer.append(char)
            for next in graph[char]! {
                inNodes[next]! -= 1
                if inNodes[next] == 0 {
                    queue.enqueue(next)
                }
            }
        }
        return answer.count < inNodes.count ? "" : answer
    }
}


/*
  First-in first-out queue (FIFO)

  New elements are added to the end of the queue. Dequeuing pulls elements from
  the front of the queue.

  Enqueuing and dequeuing are O(1) operations.
*/
public struct Queue<T> {
  fileprivate var array = [T?]()
  fileprivate var head = 0

  public var isEmpty: Bool {
    return count == 0
  }

  public var count: Int {
    return array.count - head
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  public mutating func dequeue() -> T? {
    guard let element = array[guarded: head] else { return nil }

    array[head] = nil
    head += 1

    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }

    return element
  }

  public var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
}

extension Array {
    subscript(guarded idx: Int) -> Element? {
        guard (startIndex..<endIndex).contains(idx) else {
            return nil
        }
        return self[idx]
    }
}
