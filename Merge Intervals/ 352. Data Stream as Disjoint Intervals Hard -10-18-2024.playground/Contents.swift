/**
 # 352. Data Stream as Disjoint Intervals
 [LeetCode Problem 352](https://leetcode.com/problems/data-stream-as-disjoint-intervals/)

 Given a data stream input of non-negative integers, the task is to summarize the numbers as a set of disjoint intervals.

 Implement the `SummaryRanges` class:

 - `SummaryRanges()`: Initializes the object with an empty stream.
 - `void addNum(int value)`: Adds the integer `value` to the data stream.
 - `int[][] getIntervals()`: Returns a summary of the disjoint intervals for the current data stream.

 ## Example:

 Input:
 ["SummaryRanges", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals"]
 [[], [1], [], [3], [], [7], [], [2], [], [6], []]

 Output:
 [null, null, [[1, 1]], null, [[1, 1], [3, 3]], null, [[1, 1], [3, 3], [7, 7]], null, [[1, 3], [7, 7]], null, [[1, 3], [6, 7]]]

 Explanation:
 SummaryRanges summaryRanges = new SummaryRanges();
 summaryRanges.addNum(1);      // arr = [1]
 summaryRanges.getIntervals(); // return [[1, 1]]
 summaryRanges.addNum(3);      // arr = [1, 3]
 summaryRanges.getIntervals(); // return [[1, 1], [3, 3]]
 summaryRanges.addNum(7);      // arr = [1, 3, 7]
 summaryRanges.getIntervals(); // return [[1, 1], [3, 3], [7, 7]]
 summaryRanges.addNum(2);      // arr = [1, 2, 3, 7]
 summaryRanges.getIntervals(); // return [[1, 3], [7, 7]]
 summaryRanges.addNum(6);      // arr = [1, 2, 3, 6, 7]
 summaryRanges.getIntervals(); // return [[1, 3], [6, 7]]

 ## Constraints:
 - **0 <= value <= 10^4**
 - **At most 3 * 10^4 calls** will be made to `addNum` and `getIntervals`.
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

class SummaryRanges {

    init() {
        // Constructor to initialize the SummaryRanges object
    }

    func addNum(_ value: Int) {
        // Function to add a number to the data stream
    }

    func getIntervals() -> [Interval] {
        // Function to return the disjoint intervals
        return []
    }
}
