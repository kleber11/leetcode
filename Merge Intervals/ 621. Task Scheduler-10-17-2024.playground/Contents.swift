/**
 # 621. Task Scheduler
 [LeetCode Problem 621](https://leetcode.com/problems/task-scheduler/)

 Given a characters array `tasks`, where each character represents a task. Each task must be done **exactly once**. There is a non-negative integer `n` that represents the minimum interval between the same tasks (i.e., two **same tasks** must be at least `n` units of time apart). At any time, the CPU can execute a task or be idle.

 Return the least number of units of times that the CPU will take to finish all the given tasks.

 ## Example 1:

 - **Input**: `tasks = ["A","A","A","B","B","B"]`, `n = 2`
 - **Output**: `8`
 - **Explanation**: A possible solution could be: `A -> B -> idle -> A -> B -> idle -> A -> B`. Total units of time = `8`.

 ## Example 2:

 - **Input**: `tasks = ["A","A","A","B","B","B"]`, `n = 0`
 - **Output**: `6`
 - **Explanation**: On this case any arrangement of the tasks will result in 6 units of time since `n = 0`.

 ## Example 3:

 - **Input**: `tasks = ["A","A","A","B","B","B"]`, `n = 1`
 - **Output**: `6`

 ## Constraints:

 - `1 <= tasks.length <= 10^4`
 - `tasks[i]` is an upper-case English letter.
 - The integer `n` is in the range `[0, 100]`.

 ## Topics:
 - Arrays
 - Greedy
 - Heap (Priority Queue)
 - Counting
 */

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    // Base function to return the least number of units of time to finish all tasks
    // Logic to be implemented here
    return 0
}

