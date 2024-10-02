/*
# Two Sum Problem - https://leetcode.com/problems/two-sum/description/?envType=problem-list-v2&envId=mg1j2op3

**Difficulty:** Easy
**Solved:** Yes

## Problem Overview:
Given an array of integers `nums` and an integer `target`, the task is to **return the indices** of the two numbers such that they add up to the target.
- Each input will have **exactly one solution**.
- You may **not use the same element twice**.
- The answer can be returned in any order.

## Example Scenarios:

### Example 1:
**Input:**
nums = [2, 7, 11, 15], target = 9
**Output:**
[0, 1]
**Explanation:**
`nums[0] + nums[1] == 9`, therefore we return [0, 1].

### Example 2:
**Input:**
nums = [3, 2, 4], target = 6
**Output:**
[1, 2]

### Example 3:
**Input:**
nums = [3, 3], target = 6
**Output:**
[0, 1]

## Constraints:
- The array `nums` will have a length between **2 and 10^4**.
- Each element in the array `nums[i]` will be between **-10^9 and 10^9**.
- The target value `target` will also be between **-10^9 and 10^9**.
- **Only one valid answer exists**.

## Follow-Up:
Can you find a solution with a **time complexity better than O(n²)**?
*/

// In this case we return indicies of sorted array.
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var p1 = 0
    var p2 = nums.count - 1
    var sorted = nums.sorted()
    while p1 != p2 {
        if sorted[p1] + sorted[p2] == target {
            return [p1, p2]
        } else if sorted[p1] + sorted[p2] < target {
            p1 += 1
        } else {
            p2 -= 1
        }
    }
    return []
}

print(twoSum([3,2,4], 6))

// The follow up would be to return indicies of original array with optimal time and space complexity (O(N logN)).
// The approach is to use HashMap (Dictionary)
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var result: [Int: Int] = [:]
    for (index, number) in nums.enumerated() {
        let numberToFind = target - number
        if let result = result[numberToFind] {
            return [index, result]
        } else {
            result[number] = index
        }
    }
    return []
}
print(twoSum2([3,2,4], 6))
