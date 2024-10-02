/*
 26. Remove Duplicates from Sorted Array
 Solved: Easy

 ---- Problem Description ----
 Given an integer array `nums` sorted in non-decreasing order,
 remove the duplicates **in-place** such that each unique element appears only once.
 The relative order of the elements should be kept the same.
 Then return the number of **unique elements** in `nums`.

 ---- Requirements ----
 Consider the number of unique elements `k`. To meet the acceptance criteria:
 1. Modify the array `nums` such that the first `k` elements of `nums` contain the unique elements in the
    order they were originally present.
 2. The remaining elements of `nums` are not important and can be ignored.
 3. Return `k`.

 ---- Custom Judge ----
 The judge will test your solution with the following code:

     int[] nums = [...];            // Input array
     int[] expectedNums = [...];    // Expected answer with correct length

     int k = removeDuplicates(nums); // Calls your implementation

     assert k == expectedNums.length;
     for (int i = 0; i < k; i++) {
         assert nums[i] == expectedNums[i];
     }

 If all assertions pass, your solution will be accepted.

 ---- Example 1 ----
 Input: nums = [1,1,2]
 Output: 2, nums = [1,2,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
 It does not matter what is left beyond the returned `k` (represented by underscores).

 ---- Example 2 ----
 Input: nums = [0,0,1,1,1,2,2,3,3,4]
 Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4.
 It does not matter what you leave beyond the returned `k` (represented by underscores).

 ---- Constraints ----
 1. 1 <= nums.length <= 3 * 10^4
 2. -100 <= nums[i] <= 100
 3. nums is sorted in non-decreasing order.

 ---- Key Points ----
 - In-place modification: You cannot use extra space for another array.
 - Maintain relative order of elements.
*/

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }
    var nextNonDuplicate = 1

    for number in 1..<nums.count {
        if nums[nextNonDuplicate - 1] != nums[number] {
            nums[nextNonDuplicate] = nums[number]
            nextNonDuplicate += 1
        }
    }

    return nextNonDuplicate
}
var arr = [2, 3, 3, 3, 6, 9, 9]
print(removeDuplicates(&arr))
