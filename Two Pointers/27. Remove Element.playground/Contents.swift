/*
 Problem 27: Remove Element (Easy)

 Given an integer array `nums` and an integer `val`, remove all occurrences of `val` in `nums` **in-place**.
 The order of the elements **may be changed**. After the operation, return the number of elements in `nums`
 which are **not equal to** `val`.

 Consider the number of elements in `nums` that are **not equal to** `val` to be `k`. To get accepted, you
 need to do the following:

 1. Change the array `nums` so that the **first `k` elements** contain the elements which are **not equal** to `val`.
 2. The **remaining elements** of `nums` **are not important**, as well as the size of `nums`.
 3. **Return `k`**.

 **Custom Judge**:
 The judge will test your solution with the following code:

 int[] nums = [...];   // **Input array**
 int val = ...;        // **Value to remove**
 int[] expectedNums = [...]; // The **expected answer** with correct length.
                             // It is sorted with **no values equaling `val`**.

 int k = removeElement(nums, val);  // **Calls your implementation**

 assert k == expectedNums.length;   // **Check if the length is correct**
 sort(nums, 0, k);                  // **Sort the first `k` elements** of `nums`
 for (int i = 0; i < actualLength; i++) {
     assert nums[i] == expectedNums[i];  // **Verify that elements match expected output**
 }
 If all assertions pass, then your solution will be accepted.

 **Example 1**:
 Input: nums = [3, 2, 2, 3], val = 3
 Output: 2, nums = [2, 2, _, _]
 Explanation:
 - Your function should return **`k = 2`**, with the first two elements of `nums` being `2`.
 - It **does not matter** what you leave beyond the returned `k` (hence they are underscores).

 **Example 2**:
 Input: nums = [0, 1, 2, 2, 3, 0, 4, 2], val = 2
 Output: 5, nums = [0, 1, 4, 0, 3, _, _, _]
 Explanation:
 - Your function should return **`k = 5`**, with the first five elements of `nums` containing `0, 1, 4, 0, 3`.
 - Note that the five elements **can be returned in any order**.
 - It **does not matter** what you leave beyond the returned `k` (hence they are underscores).

 **Constraints**:
 - `0 <= nums.length <= 100`
 - `0 <= nums[i] <= 50`
 - `0 <= val <= 100`
 */

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var lPointer = 0
    var rPointer = nums.count - 1

    while lPointer <= rPointer {
        if nums[rPointer] == val {
            rPointer -= 1
        } else {
            var temp = nums[lPointer]
            nums[lPointer] = nums[rPointer]
            nums[rPointer] = temp
            lPointer += 1
        }
    }
    return lPointer
}

var array = [0, 1, 2, 2, 3, 0, 4, 2]
removeElement(&array, 2)
