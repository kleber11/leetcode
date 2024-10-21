/**
 # 56. Merge Intervals
 [LeetCode Problem 56](https://leetcode.com/problems/merge-intervals/)

 Given an array of intervals where `intervals[i] = [start_i, end_i]`, merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

 ## Example 1:

 - **Input**: `intervals = [[1,3],[2,6],[8,10],[15,18]]`
 - **Output**: `[[1,6],[8,10],[15,18]]`
 - **Explanation**: Since intervals `[1,3]` and `[2,6]` overlap, merge them into `[1,6]`.

 ## Example 2:

 - **Input**: `intervals = [[1,4],[4,5]]`
 - **Output**: `[[1,5]]`
 - **Explanation**: Intervals `[1,4]` and `[4,5]` are considered overlapping and merged into `[1,5]`.

 ## Constraints:

 - `1 <= intervals.length <= 10^4`
 - `intervals[i].length == 2`
 - `0 <= start_i <= end_i <= 10^4`

 ## Topics:
 - Arrays
 - Sorting
 - Intervals
 */

/// Base class just for convenience
class Interval {

    var start: Int
    var end: Int

    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

/// To efficiently solve this problem, there are few steps you have to follow:
///  - **Step 1:** –– Sort the intervals by start time. This allows you to iterate through all intervals in order and merge them if they overlap.
///  - **Step 2:** –– Iterate through the sorted list and keep merging them if the start time of current interval is less than or equal to end of the previous (merged) interval.
///  - **Step 3:** –– Add non-overlapping intervals.

func merge(_ intervals: [Interval]) -> [Interval] {
    // Make sure `intervals` is not empty array.
    guard intervals.count > 0 else { return [] }
    // Define properties
    var result: [Interval] = []
    var intervals = intervals.sorted(by: { $0.start < $1.start }) // Sort array by first (start) element

    // Iterate through intervals
    for interval in intervals {
        // On first iteration `result` will be empty. So, you have to add first interval.
        // On next iterations check if last added interval ends before current starts.
        if result.isEmpty || result.last!.end < interval.start {
            result.append(interval) // No overlaps, add `interval` to array.
        } else {
            result[result.count - 1].end = max(interval.end, result.last!.end) // Overlap detected, merge the interval by updating `end` value.
        }
    }

    // Return result
    return result
}

let first = Interval(1, 4)
let second = Interval(0, 4)
merge([first, second])
