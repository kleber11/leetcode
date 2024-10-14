/**
  # LeetCode Problem 21: Merge Two Sorted Lists

  Merges two sorted linked lists into one sorted list by splicing together the nodes from the two input lists.

  - Parameters:
    - list1: The head of the first sorted linked list.
    - list2: The head of the second sorted linked list.

  - Returns: The head of the merged sorted linked list.

  ## Important Notes:
  - Both input lists are sorted in **non-decreasing** order.
  - Time complexity: **O(n + m)**, where `n` is the length of `list1` and `m` is the length of `list2`.
  - Space complexity: **O(1)**, as no extra space is used apart from the new list creation.

  ## Examples:
  - Example 1:
    - Input: `list1 = [1, 2, 4]`, `list2 = [1, 3, 4]`
    - Output: `[1, 1, 2, 3, 4, 4]`

  - Example 2:
    - Input: `list1 = []`, `list2 = []`
    - Output: `[]`

  - Example 3:
    - Input: `list1 = []`, `list2 = [0]`
    - Output: `[0]`

  ## Constraints:
  - The number of nodes in both lists is in the range `[0, 50]`.
  - Each node’s value is within the range `[-100, 100]`.
  - Both `list1` and `list2` are sorted in non-decreasing order.
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    // First step is to create a `dummy` node
    // and new list which will be returned as merged
    var dummy: ListNode? = ListNode(0)
    var currentNode: ListNode? = dummy

    // Create copy of both lists (since in Swift they can not be changed)
    var list1 = list1
    var list2 = list2

    // Iterate through both lists and compare its value
    while list1 != nil, list2 != nil {
        if list1!.val < list2!.val {
            currentNode?.next = list1
            list1 = list1?.next
        } else {
            currentNode?.next = list2
            list2 = list2?.next
        }
        currentNode = currentNode?.next
    }

    // Handle edge case where one of lists can be `nil` before another
    // then add rest of list to the end.
    if list1 == nil {
        currentNode?.next = list2
    }

    if list2 == nil {
        currentNode?.next = list1
    }

    return dummy?.next
}

mergeTwoLists(.init(1, .init(2, .init(4))), .init(1, .init(3, .init(4))))

