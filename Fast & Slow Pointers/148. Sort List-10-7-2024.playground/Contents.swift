/**
 ## 148. Sort List

 **Medium**

 **Topics:** Linked List, Sorting

 Given the **head** of a linked list, return the list after sorting it in **ascending order**.

 ## Example 1:
 **Input:** `head = [4,2,1,3]`
 **Output:** `[1,2,3,4]`

 ## Example 2:
 **Input:** `head = [-1,5,3,4,0]`
 **Output:** `[-1,0,3,4,5]`

 ## Example 3:
 **Input:** `head = []`
 **Output:** `[]`

 ## Constraints:
 - The number of nodes in the list is in the range **[0, 5 * 10^4]**.
 - **-10^5 <= Node.val <= 10^5**

 ## Follow up:
 Can you sort the linked list in **O(n log n)** time and **O(1)** memory (i.e., constant space)?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func sortList(_ head: ListNode?) -> ListNode? {
    // Make sure `head` and its next value are not nil.
    guard head != nil, head?.next != nil else { return head }

    // Split list into two halves
    // Set `left` part of list to `head`
    var leftSide = head
    // Set `right` to the next element of middle
    var rightSide = getMiddleElement(head)
    var temp = rightSide?.next // Save middle node to temp variable
    rightSide?.next = nil // Make sure `left` side ends on beginning of `right` side
    rightSide = temp

    // Sort both side recursively
    var sortedLeft = sortList(leftSide)
    var sortedRight = sortList(rightSide)

    return merge(sortedLeft, sortedRight)
}

func getMiddleElement(_ node: ListNode?) -> ListNode? {
    // Define `fast` and `slow` pointers.
    var fastP = node?.next
    var slowP = node
    // Find middle
    while fastP != nil, fastP?.next != nil {
        fastP = fastP?.next?.next
        slowP = slowP?.next
    }

    return slowP
}

func merge(_ right: ListNode?, _ left: ListNode?) -> ListNode? {
    var dummy = ListNode(0)
    var current = dummy
    var right = right
    var left = left

    while right != nil, left != nil {
        if right!.val < left!.val {
            current.next = right
            right = right?.next
        } else {
            current.next = left
            left = left?.next
        }
        current = current.next!
    }
    current.next = left == nil ? right : left

    return dummy.next
}

//print(sortList(.init(4, .init(2, .init(1, .init(3))))))

getMiddleElement(.init(4, .init(2, .init(1, .init(3)))))
