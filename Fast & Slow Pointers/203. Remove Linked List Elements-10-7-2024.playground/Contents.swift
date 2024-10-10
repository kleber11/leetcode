/**
 ## 203. Remove Linked List Elements

 **Easy**

 **Topics:** Linked List

 Given the head of a linked list and an integer **val**, remove all the nodes of the linked list that have `Node.val == val`, and return the new head.

 ## Example 1:
 **Input:** `head = [1,2,6,3,4,5,6], val = 6`
 **Output:** `[1,2,3,4,5]`

 ## Example 2:
 **Input:** `head = [], val = 1`
 **Output:** `[]`

 ## Example 3:
 **Input:** `head = [7,7,7,7], val = 7`
 **Output:** `[]`

 ## Constraints:
 - The number of nodes in the list is in the range **[0, 10^4]**.
 - **1 <= Node.val <= 50**
 - **0 <= val <= 50**
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    // Create a dummy node with any value, does not matter
    var prev: ListNode = ListNode(0, head)
    // Create `current` to iterate through in case
    // if first element in list is the one should be removed.
    var current: ListNode? = prev
    // Iterate through list
    while current?.next != nil {
        if current?.next?.val == val {
            // If it is element to be removed, skip it
            current?.next = current?.next?.next
        } else {
            // Move current pointers to next `non-removable` element
            current = current?.next
        }
    }
    // Return new head's next value (first is dummy).
    return prev.next
}

var list = ListNode(71, .init(7, .init(7, .init(7, .init(7, .init(7, .init(7)))))))
removeElements(list, 7)
