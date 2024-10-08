/**
 ## 142. Linked List Cycle II

 **Medium**

 **Topics:** Linked List, Two Pointers

 Given the **head** of a linked list, return the node where the **cycle begins**. If there is no cycle, return **null**.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, **pos** is used to denote the index of the node that the tail's next pointer is connected to (0-indexed). It is **-1** if there is no cycle. Note that **pos** is not passed as a parameter.

 Do not modify the linked list.

 ## Example 1:
 **Input:** `head = [3,2,0,-4], pos = 1`
 **Output:** tail connects to node index `1`
 **Explanation:** There is a cycle in the linked list, where the tail connects to the second node.

 ## Example 2:
 **Input:** `head = [1,2], pos = 0`
 **Output:** tail connects to node index `0`
 **Explanation:** There is a cycle in the linked list, where the tail connects to the first node.

 ## Example 3:
 **Input:** `head = [1], pos = -1`
 **Output:** no cycle
 **Explanation:** There is no cycle in the linked list.

 ## Constraints:
 - The number of nodes in the list is in the range **[0, 10^4]**.
 - **-10^5 <= Node.val <= 10^5**
 - **pos** is **-1** or a valid index in the linked list.

 ## Follow up:
 Can you solve it using **O(1)** (i.e., constant) memory?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func detectCycle(_ head: ListNode?) -> ListNode? {
    // Define pointers
    var fastP = head
    var slowP = head

    // Iterate through list
    while fastP != nil, fastP?.next != nil {
        fastP = fastP?.next?.next
        slowP = slowP?.next

        // If they met, there is a cycle.
        if fastP === slowP {
            break
        }
    }

    // No cycle detected
    if fastP == nil, fastP?.next == nil {
        return nil
    }

    // Next, reinitialize `slow` to the start of list
    // and on each step until they meet update them by only one step
    // this is exactly how Floyd's algo works.

    slowP = head
    while slowP !== fastP {
        fastP = fastP?.next
        slowP = slowP?.next
    }

    return slowP
}
