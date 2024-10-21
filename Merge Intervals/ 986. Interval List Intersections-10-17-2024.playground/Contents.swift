/**
 # 986. Interval List Intersections
 [LeetCode Problem 986](https://leetcode.com/problems/interval-list-intersections/)

 You are given two lists of closed intervals, `firstList` and `secondList`, where `firstList[i] = [start_i, end_i]` and `secondList[j] = [start_j, end_j]`. Each list of intervals is pairwise disjoint and in sorted order.

 Return the intersection of these two interval lists. A closed interval `[a, b]` (with `a <= b`) denotes the intersection of two intervals, and it is an interval that is present in both interval lists.

 ## Example 1:

 - **Input**: `firstList = [[0,2],[5,10],[13,23],[24,25]]`, `secondList = [[1,5],[8,12],[15,24],[25,26]]`
 - **Output**: `[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]`

 ## Example 2:

 - **Input**: `firstList = [[1,3],[5,9]]`, `secondList = [[4,8]]`
 - **Output**: `[[5,8]]`

 ## Constraints:

 - `0 <= firstList.length, secondList.length <= 1000`
 - `firstList[i].length == 2`
 - `secondList[j].length == 2`
 - `0 <= start_i <= end_i <= 10^9`
 - `0 <= start_j <= end_j <= 10^9`

 ## Topics:
 - Arrays
 - Two Pointers
 - Intervals
 */

// Base class
class Interval {

    var start: Int
    var end: Int

    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func intervalIntersection(_ firstList: [Interval], _ secondList: [Interval]) -> [Interval] {
    // Make sure both arrays are not empty.
    guard !firstList.isEmpty else { return secondList }
    guard !secondList.isEmpty else { return firstList }

    // Define properties
    var result: [Interval] = []
    /// Use `Two pointers` approach to iterate throught intervals.
    var p1 = 0
    var p2 = 0
    
    // Iterate through both lists
    while p1 < firstList.count, p2 < secondList.count {
        // Find `max` starting point
        // and `min` ending point of both intervals
        var intersection: Interval = .init(
            max(firstList[p1].start, secondList[p2].start),
            min(firstList[p1].end, secondList[p2].end)
        )

        if intersection.start <= intersection.end {
            result.append(intersection)
        }

        if firstList[p1].end < secondList[p2].end {
            p1 += 1
        } else {
            p2 += 1
        }
    }

    return result
}

intervalIntersection([.init(1, 3), .init(5, 9)], [.init(4, 8)])
intervalIntersection([.init(1, 3), .init(5, 6), .init(7, 9)], [.init(2, 5), .init(6, 8)])

// Time complexity: O(n+m), where `n` = firstList.count, `m` = secondList.count, -> O(2n) -> O(n)
// Space complexity: O(n)
