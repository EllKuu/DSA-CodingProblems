import Foundation

/*
    Leetcode 19: Remove nth node from end of list

    Given the head of a linked list, remove the nth node from the end of the list and return its head.
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public init?(_ array: [Int]) {
        guard !array.isEmpty else { return nil }
        self.val = array[0]
        var prev: ListNode = self
        for i in 1..<array.count {
            let new = ListNode(array[i])
            prev.next = new
            prev = new
        }
    }
}
extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}

var list = ListNode([1,2])
var n = 1

// using arrays
// Time: O(n) Space: O(n)
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    if head == nil { return nil}
    var h:ListNode?
    var c = head
    var a = [ListNode]()
    
    // append all nodes to the array
    while c != nil {
        a.append(c!)
        c = c?.next
    }
    // remove node from array at index
    a.remove(at: a.count-n)
    // nil out each nodes next pointer
    a.forEach { l in
        l.next = nil
    }
    
    if a.isEmpty { return h }
    h = a[0]
    c = a[0]
    
    // reassign nodes next pointers using the order in the array
    for i in 1..<a.count{
        h?.next = a[i]
        h = h?.next
    }
    
    return c
}

// using pointers
// Time: O(n) Space: O(1)
func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
       
    guard let h = head else { return nil }
   
    var newHead = ListNode()
    var fast:ListNode? = newHead
    var slow:ListNode? = newHead
    newHead.next = h
   
    for i in 0...n  {
        fast = fast?.next
    }
    
    while fast != nil {
        slow = slow?.next
        fast = fast?.next
    }

    slow?.next = slow?.next?.next
    
    return newHead.next
}

