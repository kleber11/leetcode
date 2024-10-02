/*
Problem: Two Sum II - Input Array Is Sorted

Objective:
Given a 1-indexed array of integers `numbers`, which is already sorted in non-decreasing order, find two numbers such that they add up to a specific `target`.
Let these two numbers be `numbers[index1]` and `numbers[index2]`, where 1 <= index1 < index2 <= numbers.length.

You need to return the indices of the two numbers, incremented by one, as an integer array [index1, index2].

Important Constraints:
- There is exactly one solution.
- Constant extra space must be used.
- The same element cannot be used twice.

Examples:

Example 1:
Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9, so index1 = 1, index2 = 2.

Example 2:
Input: numbers = [2,3,4], target = 6
Output: [1,3]
Explanation: The sum of 2 and 4 is 6, so index1 = 1, index2 = 3.

Example 3:
Input: numbers = [-1,0], target = -1
Output: [1,2]
Explanation: The sum of -1 and 0 is -1, so index1 = 1, index2 = 2.
*/


func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var lPointer = 0
    var rPointer = numbers.count - 1

    while lPointer < rPointer {
        let numberToFind = numbers[rPointer] + numbers[lPointer]
        if target == numberToFind {
            return [lPointer + 1, rPointer + 1]
        } else if numberToFind > target {
            rPointer -= 1
        } else {
            lPointer += 1
        }
    }
    return []
}
twoSum([2,7,11,15], 9)
