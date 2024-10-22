/**
 # 435. Non-overlapping Intervals
 [LeetCode Problem 435](https://leetcode.com/problems/non-overlapping-intervals/)

 Given an array of intervals `intervals` where `intervals[i] = [start_i, end_i]`, return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

 ## Example 1:

 - **Input**: `intervals = [[1,2],[2,3],[3,4],[1,3]]`
 - **Output**: `1`
 - **Explanation**: Removing interval `[1,3]` leaves the rest of the intervals non-overlapping.

 ## Example 2:

 - **Input**: `intervals = [[1,2],[1,2],[1,2]]`
 - **Output**: `2`
 - **Explanation**: You need to remove two `[1,2]` to make the rest of the intervals non-overlapping.

 ## Example 3:

 - **Input**: `intervals = [[1,2],[2,3]]`
 - **Output**: `0`
 - **Explanation**: You don't need to remove any intervals since they are already non-overlapping.

 ## Constraints:

 - `1 <= intervals.length <= 10^5`
 - `intervals[i].length == 2`
 - `-5 * 10^4 <= start_i < end_i <= 5 * 10^4`

 ## Topics:
 - Arrays
 - Greedy
 - Sorting
 */

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    // Make sure `intervals` contains enaugh elements.
    guard intervals.count > 1 else { return 0 }
    // Define properties
    var result = 0
    var sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] }) // Sort intervals by `start` time
    var end = sortedIntervals[0][1]

    // Iterate through intervals
    for i in 1..<sortedIntervals.count {
        if sortedIntervals[i][0] < end {
            result += 1
            end = min(sortedIntervals[i][1], end)
        } else {
            end = sortedIntervals[i][1]
        }
    }

    return result
}

eraseOverlapIntervals([[1,2],[1,2],[1,2]])
eraseOverlapIntervals([[1,3], [2,4], [3,5]])
eraseOverlapIntervals([[1,10], [2,6], [3,5], [7,9]])
eraseOverlapIntervals([[0,2],[1,3],[2,4],[3,5],[4,6]])
