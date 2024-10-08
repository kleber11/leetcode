/**
 Sort Colors

 Given an array `nums` with `n` objects colored red, white, or blue, this function sorts the array in-place so that objects of the same color are adjacent. The colors must be sorted in the order red, white, and blue.

 We will use the integers `0`, `1`, and `2` to represent the colors red, white, and blue, respectively. The solution must not use the library's sort function and must be solved with constant extra space.

 ## Example 1
 - Input: `nums = [2, 0, 2, 1, 1, 0]`
 - Output: `[0, 0, 1, 1, 2, 2]`

 ## Example 2
 - Input: `nums = [2, 0, 1]`
 - Output: `[0, 1, 2]`

 ## Constraints
 - `n == nums.length`
 - `1 <= n <= 300`
 - `nums[i]` is either `0`, `1`, or `2`.

 ## Follow-up
 Can you come up with a one-pass algorithm using only constant extra space?

 */

func sortColors(_ nums: inout [Int]) {
    var startP = 0
    var endP = nums.count - 1
    var index = 0

    while index <= endP {
        if nums[index] == 0 {
            nums.swapAt(index, startP)
            startP += 1
            index += 1
        } else if nums[index] == 2 {
            nums.swapAt(index, endP)
            endP -= 1
        } else {
            index += 1
        }
    }
}

var nums = [2, 0, 2, 1, 1, 0]
var nums2 = [2,0,1]
var nums3 = [2,1]
var nums4 = [1,2]
var nums5 = [1,2,0]

sortColors(&nums)
sortColors(&nums2)
sortColors(&nums3)
sortColors(&nums4)
sortColors(&nums5)
