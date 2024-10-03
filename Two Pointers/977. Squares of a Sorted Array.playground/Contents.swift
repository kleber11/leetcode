/*
 # 977. Squares of a Sorted Array (Easy)

 ## Problem Description:
 Given an integer array `nums` sorted in **non-decreasing order**, return an array of the **squares** of each number, also sorted in non-decreasing order.

 ## Example 1:
 - Input: `nums = [-4, -1, 0, 3, 10]`
 - Output: `[0, 1, 9, 16, 100]`
 - Explanation:
   - After squaring, the array becomes `[16, 1, 0, 9, 100]`.
   - After sorting, it becomes `[0, 1, 9, 16, 100]`.

 ## Example 2:
 - Input: `nums = [-7, -3, 2, 3, 11]`
 - Output: `[4, 9, 9, 49, 121]`

 ## Constraints:
 - `1 <= nums.length <= 10^4`
 - `-10^4 <= nums[i] <= 10^4`
 - `nums` is sorted in **non-decreasing order**.

 ## Follow up:
 While squaring each element and sorting the new array is **trivial**, could you find an **O(n)** solution using a different approach?

 ## Topics:
 Array Manipulation
 Two-pointer technique
*/

func sortedSquares(_ nums: [Int]) -> [Int] {
    var lPointer = 0
    var rPointer = nums.count - 1
    var copy = Array(repeating: 0, count: nums.count)
    var index = nums.count - 1

    while lPointer <= rPointer {
        let lSquare = nums[lPointer] * nums[lPointer]
        let rSquare = nums[rPointer] * nums[rPointer]

        if lSquare > rSquare {
            copy[index] = lSquare
            lPointer += 1
        } else {
            copy[index] = rSquare
            rPointer -= 1
        }

        index -= 1
    }
    return copy
}
sortedSquares([-44, -1, 0, 3, 10])
