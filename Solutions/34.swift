class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        enum SearchMode {
            case first
            case last
        }
        func binarySearch(searchMode: SearchMode) -> Int {
            var lower = nums.startIndex
            var upper = nums.endIndex-1
            while lower <= upper {
                let mid = lower + (upper - lower) / 2
                if nums[mid] < target {
                    lower = mid+1
                } else if nums[mid] > target {
                    upper = mid-1
                } else {
                    switch searchMode {
                    case .first:
                        if mid == lower || nums[mid-1] != target {
                            return mid
                        } else {
                            upper = mid-1
                        }
                    case .last:
                        if mid == upper || nums[mid+1] != target {
                            return mid
                        } else {
                            lower = mid+1
                        }
                    }
                }
            }
            return -1
        }

        let firstIndex = binarySearch(searchMode: .first)
        if firstIndex == -1 { return [-1, -1] }
        return [firstIndex, binarySearch(searchMode: .last)]
    }
}
