/**
 ## 234. Palindrome Linked List

 **Easy**

 **Topics:** Linked List

 Given the head of a singly linked list, return **true** if it is a
 **palindrome** or **false** otherwise.

 ## Example 1:
 **Input:** `head = [1,2,2,1`
 **Output:** `true`

 ## Example 2:
 **Input:** `head = [1,2]`
 **Output:** `false`

 ## Constraints:
 - The number of nodes in the list is in the range **[1, 10^5]**.
 - **0 <= Node.val <= 9**

 ## Follow up:
 Could you do it in **O(n)** time and **O(1)** space?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func isPalindrome(_ head: ListNode?) -> Bool {
    return true
}
