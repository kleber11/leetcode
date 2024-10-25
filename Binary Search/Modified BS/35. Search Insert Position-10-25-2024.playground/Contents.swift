/**
 ## LeetCode Problem 35: Search Insert Position
 https://leetcode.com/problems/search-insert-position/

 Given a sorted array of distinct integers and a target value, this function returns the index
 if the target is found. If not, it returns the index where the target would be inserted
 in order while maintaining sorted order.

 Constraints:
 - The input array `nums` has a length between 1 and 10^4.
 - Each element in `nums` is a distinct integer.
 - Elements in `nums` are sorted in ascending order.
 - The target value is an integer between -10^4 and 10^4.

 Example:
 Input: nums = [1,3,5,6], target = 5 Output: 2
*/

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    guard !nums.isEmpty else { return -1 }
    var startP = 0
    var endP = nums.count - 1

    while startP <= endP {
        let mid = startP + (endP - startP) / 2
        if target == nums[mid] {
            return mid
        }

        if target < nums[mid] {
            endP = mid - 1
        } else {
            startP = mid + 1
        }
    }

    return startP
}

searchInsert([1,3,5,6], 2)
searchInsert([1,3,5,6], 7)
searchInsert([2, 4, 6, 8, 10, 12, 14, 16, 18, 20], 19)
