/**
 # 252. Meeting Rooms
 [LeetCode Problem 252](https://leetcode.com/problems/meeting-rooms/)

 Given an array of meeting time intervals `intervals` where `intervals[i] = [start_i, end_i]`, determine if a person could attend all meetings.

 ## Example 1:

 - **Input**: `intervals = [[0,30],[5,10],[15,20]]`
 - **Output**: `false`
 - **Explanation**: A person cannot attend all meetings since they overlap (e.g., meeting 1 overlaps with meeting 2).

 ## Example 2:

 - **Input**: `intervals = [[7,10],[2,4]]`
 - **Output**: `true`
 - **Explanation**: There is no overlap between the two meetings.

 ## Constraints:

 - `0 <= intervals.length <= 10^4`
 - `intervals[i].length == 2`
 - `0 <= start_i < end_i <= 10^6`

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

func canAttendMeetings(_ intervals: [Interval]) -> Bool {
    // If there is only one class, person definitely can attend.
    guard intervals.count > 1 else { return true }

    // Sort meetings by start time.
    var sortedMeetings = intervals.sorted(by: { $0.start < $1.start })

    // Iterate through meetings and detect overlaps.
    for index in 1..<sortedMeetings.count {
        if sortedMeetings[index].start < sortedMeetings[index - 1].end {
            return false
        }
    }
    return true
}

let intervals: [Interval] = [.init(0, 30), .init(5, 10), .init(15, 20)]
canAttendMeetings(intervals)

let intervalsSecond: [Interval] = [.init(7, 10), .init(2, 4)]
canAttendMeetings(intervalsSecond)
