/**
  ## LeetCode Problem 206: Reverse Linked List

  Reverses a singly linked list and returns the reversed list.

  - Parameters:
    - head: The head of the singly linked list.
  - Returns: The head of the reversed linked list.

  ## **Important Notes**:
  - This problem can be solved either **iteratively** or **recursively**.
  - Time complexity: **O(n)**, where `n` is the number of nodes in the list.
  - Space complexity:
    - Iterative approach: **O(1)**, since it uses constant space.
    - Recursive approach: **O(n)**, due to recursion stack.

  ## Examples:
  - Example 1:
    - Input: `head = [1, 2, 3, 4, 5]`
    - Output: `[5, 4, 3, 2, 1]`

  - Example 2:
    - Input: `head = [1, 2]`
    - Output: `[2, 1]`

  - Example 3:
    - Input: `head = []`
    - Output: `[]`

  ## Constraints:
  - The number of nodes is in the range `[0, 5000]`.
  - Each node’s value is within the range `[-5000, 5000]`.

  ## Follow-Up:
  Implement both the **iterative** and **recursive** solutions.
*/


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    guard head != nil, head?.next != nil else { return head }
    var current: ListNode? = head
    var prev: ListNode? = nil

    while current != nil {
        let next = current?.next
        current?.next = prev
        prev = current
        current = next
    }
    return prev
}

reverseList(.init(1, .init(2, .init(3, .init(4)))))
