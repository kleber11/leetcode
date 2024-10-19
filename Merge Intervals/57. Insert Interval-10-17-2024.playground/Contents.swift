/**
 # 57. Insert Interval
 [LeetCode Problem 57](https://leetcode.com/problems/insert-interval/)

 You are given an array of non-overlapping intervals `intervals` where `intervals[i] = [start_i, end_i]` representing the start and the end of the `i-th` interval and `intervals` is sorted in ascending order by `start_i`. You are also given an interval `newInterval = [start, end]` that represents a new interval to insert into `intervals`.

 Insert `newInterval` into `intervals` such that the intervals are still non-overlapping and sorted in ascending order by `start_i`. Return the new array of intervals after the insertion.

 ## Example 1:

 - **Input**: `intervals = [[1,3],[6,9]], newInterval = [2,5]`
 - **Output**: `[[1,5],[6,9]]`

 ## Example 2:

 - **Input**: `intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]`
 - **Output**: `[[1,2],[3,10],[12,16]]`
 - **Explanation**: The new interval `[4,8]` overlaps with intervals `[3,5]`, `[6,7]`, and `[8,10]`.

 ## Constraints:

 - `0 <= intervals.length <= 10^4`
 - `intervals[i].length == 2`
 - `0 <= start_i <= end_i <= 10^5`
 - `intervals` is sorted by `start_i` in ascending order.
 - `newInterval.length == 2`
 - `0 <= start <= end <= 10^5`

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

func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
    // Define properties
    var i = 0
    var n = intervals.count
    var result: [Interval] = []

    // Step 1: Add all intervals that end before new interval starts
    while i < n, intervals[i].end < newInterval.start {
        result.append(intervals[i])
        i += 1
    }

    // Step 2: Merge overlapping intervals
    var newInterval = newInterval
    while i < n, intervals[i].start <= newInterval.end {
        newInterval.start = min(intervals[i].start, newInterval.start)
        newInterval.end = max(intervals[i].end, newInterval.end)
        i += 1
    }
    result.append(newInterval)

    // Step 3: Add rest of intervals
    while i < n {
        result.append(intervals[i])
        i += 1
    }

    return result
}

insert([.init(1, 3), .init(6, 9)], .init(2, 5))
insert([.init(1, 2), .init(3, 5), .init(6, 7), .init(8, 10), .init(12, 16)], .init(4, 8))
