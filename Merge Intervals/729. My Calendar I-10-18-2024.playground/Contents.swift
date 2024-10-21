/**
 ## 729. My Calendar I
 [LeetCode Problem 729](https://leetcode.com/problems/my-calendar-i/)

 You are implementing a calendar system. A new event can be added if it does not overlap with existing events in the calendar.

 Implement the `MyCalendar` class:

 - `MyCalendar()`: Initializes the calendar object.
 - `boolean book(int start, int end)`: Books the event in the calendar and returns true if the event can be booked successfully without overlapping with existing events. Otherwise, returns false.

 ## Example:

 Input:
 ["MyCalendar", "book", "book", "book"]
 [[], [10, 20], [15, 25], [20, 30]]

 Output:
 [null, true, false, true]

 Explanation:
 MyCalendar myCalendar = new MyCalendar();
 myCalendar.book(10, 20); // returns true
 myCalendar.book(15, 25); // returns false, the event cannot be booked because it overlaps the event [10, 20].
 myCalendar.book(20, 30); // returns true, the event can be booked because it does not overlap with the event [10, 20].

 ## Constraints:
 - **0 <= start < end <= 10^9**
 - At most **1000** calls will be made to `book`.
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

class MyCalendar {
    
    init() {

    }

    func book(_ start: Int, _ end: Int) -> Bool {
        // Function to book the event in the calendar
        return false
    }
}
