/*
 # 283. Move Zeroes (Easy)

 ## Problem Description:
 Given an integer array `nums`, move all **0's** to the end of it while maintaining the **relative order** of the non-zero elements.

 **Note:** You must do this **in-place**, without making a copy of the array.

 ## Example 1:
 - Input: `nums = [0,1,0,3,12]`
 - Output: `[1,3,12,0,0]`

 ## Example 2:
 - Input: `nums = [0]`
 - Output: `[0]`

 ## Constraints:
 - `1 <= nums.length <= 10^4`
 - `-2^31 <= nums[i] <= 2^31 - 1`

 ## Follow up:
 Could you minimize the total number of operations performed?

 ## Topics:
 Array Manipulation
 In-place Algorithm
*/

func moveZeroes(_ nums: inout [Int]) {
    var lPointer = 0
    for rPointer in 0..<nums.count {
        if nums[rPointer] != 0 {
            nums.swapAt(lPointer, rPointer)
            lPointer += 1
        }
    }
}

var array = [0,1,0,3,10]
moveZeroes(&array)
