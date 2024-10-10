/**
 ## 19. Remove Nth Node From End of List

 **Medium**

 **Topics:** Linked List

 Given the head of a linked list, remove the **nth node** from the end of the list and return its head.

 ## Example 1:
 **Input:** `head = [1,2,3,4,5], n = 2`
 **Output:** `[1,2,3,5]`

 ## Example 2:
 **Input:** `head = [1], n = 1`
 **Output:** `[]`

 ## Example 3:
 **Input:** `head = [1,2], n = 1`
 **Output:** `[1]`

 ## Constraints:
 - The number of nodes in the list is **sz**.
 - **1 <= sz <= 30**
 - **0 <= Node.val <= 100**
 - **1 <= n <= sz**

 ## Follow up:
 Could you do this in one pass?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    // Define `dummy` node to handle edge cases
    // where head node is supposed to be removed.
    let dummy = ListNode(0, head)
    var slow = dummy
    var fast = dummy

    // Move fast `n` steps ahead.
    for _ in 0..<n {
        fast = fast.next!
    }

    // When `fast` reaches end, slow will be one step behind the node to be removed.
    while fast.next != nil {
        slow = slow.next!
        fast = fast.next!
    }

    // Remove node
    slow.next = slow.next?.next

    // Return head
    return dummy.next
}
