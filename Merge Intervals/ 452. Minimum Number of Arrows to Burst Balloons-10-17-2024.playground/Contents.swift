/**
 # 452. Minimum Number of Arrows to Burst Balloons
 [LeetCode Problem 452](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/)

 You are given an array `points` where `points[i] = [x_start, x_end]` represents the horizontal diameter of a balloon. You need to shoot a minimum number of arrows to burst all the balloons. An arrow can be shot vertically along the x-axis from different points, and a balloon with the diameter `x_start` to `x_end` is burst by an arrow shot at `x` if `x_start <= x <= x_end`.

 Return the minimum number of arrows that must be shot to burst all balloons.

 ## Example 1:

 - **Input**: `points = [[10,16],[2,8],[1,6],[7,12]]`
 - **Output**: `2`
 - **Explanation**: One way to burst all balloons is to shoot two arrows:
   - Shoot an arrow at `x = 6` to burst the balloons `[2,8]` and `[1,6]`.
   - Shoot another arrow at `x = 12` to burst the balloons `[10,16]` and `[7,12]`.

 ## Example 2:

 - **Input**: `points = [[1,2],[3,4],[5,6],[7,8]]`
 - **Output**: `4`
 - **Explanation**: Every balloon requires a separate arrow since there is no overlap.

 ## Example 3:

 - **Input**: `points = [[1,2],[2,3],[3,4],[4,5]]`
 - **Output**: `2`

 ## Constraints:

 - `1 <= points.length <= 10^5`
 - `points[i].length == 2`
 - `-2^31 <= x_start < x_end <= 2^31 - 1`

 ## Topics:
 - Arrays
 - Greedy
 - Sorting
 */

/// Base class for convenience
class Interval {

    /// Starting point
    var start: Int
    /// End point
    var end: Int

    /// Initializer
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func findMinArrowShots(_ points: [Interval]) -> Int {
    // Make sure points are not empty
    guard !points.isEmpty else { return 0 }

    // Define properties
    var result: Int = 1
    var sortedPoints = points.sorted(by: { $0.end < $1.end }) // Sort array to iterate through intervals
    var i = 1

    // Iterate through array
    var savedEndPoint = sortedPoints[0].end
    while i < sortedPoints.count {
        if sortedPoints[i].start > savedEndPoint {
            result += 1
            savedEndPoint = sortedPoints[i].end
        }
        i += 1
    }

    return result
}

// [[10,16],[2,8],[1,6],[7,12]]
findMinArrowShots([
    .init(10, 16),
    .init(2, 8),
    .init(1, 6),
    .init(7, 12)
])
