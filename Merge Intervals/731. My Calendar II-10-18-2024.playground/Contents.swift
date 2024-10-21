/**
 # 731. My Calendar II
 [LeetCode Problem 731](https://leetcode.com/problems/my-calendar-ii/)

 You are implementing a calendar system that allows overlapping events. An event can be added if it does not cause a triple booking, meaning that no more than two events can overlap at any given time.

 Implement the `MyCalendarTwo` class:

 - `MyCalendarTwo()`: Initializes the calendar object.
 - `boolean book(int start, int end)`: Books the event in the calendar and returns true if the event can be booked successfully without causing a triple booking. Otherwise, returns false.

 ## Example:

 Input:
 ["MyCalendarTwo", "book", "book", "book", "book"]
 [[], [10, 20], [15, 25], [20, 30], [5, 15]]

 Output:
 [null, true, true, true, false]

 Explanation:
 MyCalendarTwo myCalendar = new MyCalendarTwo();
 myCalendar.book(10, 20); // returns true
 myCalendar.book(15, 25); // returns true, the event can be booked as it overlaps with the previous one only once.
 myCalendar.book(20, 30); // returns true, the event can be booked as it does not overlap with any previous event more than twice.
 myCalendar.book(5, 15);  // returns false, the event cannot be booked because it overlaps with the first event [10, 20] and causes a triple booking.

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

class MyCalendarTwo {
    
    init() {
        // Constructor to initialize the MyCalendarTwo object
    }

    func book(_ start: Int, _ end: Int) -> Bool {
        // Function to book the event in the calendar
        return false
    }
}

