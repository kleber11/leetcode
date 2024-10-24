/**
 # 621. Task Scheduler
 [LeetCode Problem 621](https://leetcode.com/problems/task-scheduler/)

 Given a characters array `tasks`, where each character represents a task. Each task must be done **exactly once**. There is a non-negative integer `n` that represents the minimum interval between the same tasks (i.e., two **same tasks** must be at least `n` units of time apart). At any time, the CPU can execute a task or be idle.

 Return the least number of units of times that the CPU will take to finish all the given tasks.

 ## Example 1:

 - **Input**: `tasks = ["A","A","A","B","B","B"]`, `n = 2`
 - **Output**: `8`
 - **Explanation**: A possible solution could be: `A -> B -> idle -> A -> B -> idle -> A -> B`. Total units of time = `8`.

 ## Example 2:

 - **Input**: `tasks = ["A","A","A","B","B","B"]`, `n = 0`
 - **Output**: `6`
 - **Explanation**: On this case any arrangement of the tasks will result in 6 units of time since `n = 0`.

 ## Example 3:

 - **Input**: `tasks = ["A","A","A","B","B","B"]`, `n = 1`
 - **Output**: `6`

 ## Constraints:

 - `1 <= tasks.length <= 10^4`
 - `tasks[i]` is an upper-case English letter.
 - The integer `n` is in the range `[0, 100]`.

 ## Topics:
 - Arrays
 - Greedy
 - Heap (Priority Queue)
 - Counting
 */

struct MaxHeap<T: Comparable> {
    private var heap: [T] = []

    // Check if the heap is empty
    var isEmpty: Bool {
        return heap.isEmpty
    }

    // Get the count of elements
    var count: Int {
        return heap.count
    }

    // Peek at the top (maximum) element
    var peek: T? {
        return heap.first
    }

    // Insert element into the heap
    mutating func insert(_ element: T) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }

    // Remove and return the top (maximum) element
    mutating func remove() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 {
            return heap.removeFirst()
        } else {
            let maxElement = heap.first
            heap[0] = heap.removeLast()
            siftDown(from: 0)
            return maxElement
        }
    }

    // Helper function to sift an element up the heap
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let child = heap[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)

        while childIndex > 0 && heap[parentIndex] < child {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
        heap[childIndex] = child
    }

    // Helper function to sift an element down the heap
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        while true {
            let leftChildIndex = self.leftChildIndex(of: parentIndex)
            let rightChildIndex = self.rightChildIndex(of: parentIndex)
            var optionalSwapIndex: Int?

            if leftChildIndex < heap.count && heap[leftChildIndex] > heap[parentIndex] {
                optionalSwapIndex = leftChildIndex
            }

            if rightChildIndex < heap.count && heap[rightChildIndex] > (optionalSwapIndex != nil ? heap[leftChildIndex] : heap[parentIndex]) {
                optionalSwapIndex = rightChildIndex
            }

            guard let swapIndex = optionalSwapIndex else { return }

            heap.swapAt(parentIndex, swapIndex)
            parentIndex = swapIndex
        }
    }

    // Get the parent index
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    // Get the left child index
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }

    // Get the right child index
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
}

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    // Make sure `n` is not 0
    guard n > 0 else { return tasks.count }

    // Step 1: Iterate through tasks and create
    // a hashmap with number of tasks.
    var frequencyBag: [Character: Int] = [:]
    for task in tasks {
        frequencyBag[task, default: 0] += 1
    }

    // Step 2: Iterate through values in `frequency` hashmap
    // and insert element to maxHeap
    // the most frequent element will be at top
    // so we can start calculating from most frequent task.
    var maxHeap: MaxHeap<Int> = .init()
    for frequency in frequencyBag.values {
        maxHeap.insert(frequency)
    }

    // Define properties
    var time: Int = 0 // How many time we will need to perform all tasks
    var cooldownQueue: [(taskCount: Int, cooldownTime: Int)] = [] // Queue with tasks count and time to cooldown.

    // Step 3: Iterate through `maxHeap` or `cooldownQueue`
    while !maxHeap.isEmpty || !cooldownQueue.isEmpty {
        time += 1 // Update each time we iterate through heap / queue.

        // Pick the most frequent element and decrease it by one
        // If result if greater than zero
        // add next (same) element to the queue with time needs to cooldown
        if let taskToExecute = maxHeap.remove(), taskToExecute - 1 > 0 {
            cooldownQueue.append((taskToExecute - 1, time + n))
        }
        // If queue is not empty and cooldown time has expired
        // remove element from queue and add it to a heap
        if !cooldownQueue.isEmpty, cooldownQueue.first!.cooldownTime == time {
            let task = cooldownQueue.removeFirst()
            maxHeap.insert(task.taskCount)
        }
    }
    return time
}

leastInterval(["A","A","A","B","B","B"], 2)
