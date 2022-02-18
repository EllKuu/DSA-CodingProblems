import Foundation
/*
 Leetcode 23: Merge K Sorted Lists
 
 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
 
 Merge all the linked-lists into one sorted linked-list and return it.
 
 Input: lists = [[1,4,5],[1,3,4],[2,6]]
 Output: [1,1,2,3,4,4,5,6]
 Explanation: The linked-lists are:
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    // An additional initializer that can be used to implement nodes from an array
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

class Solution {
    // using brute force
    // Time: O(nk)
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        if lists.isEmpty { return nil }
        let headNodes = lists.filter { $0 != nil }
        var nodes = [ListNode]()
        
        for head in headNodes{
            var node = head
            while node != nil{
                nodes.append(node!)
                node = node!.next
            }
        }
        
        if nodes.isEmpty { return nil }
        
        var sorted = nodes.sorted { $0.val < $1.val }
        let dummy = ListNode(-1)
        var start = dummy
        
        for n in sorted{
            start.next = n
            start = n
        }
        start.next = nil
        return dummy.next
    }
    
    // using recursion
    // Time: O(nlogk) Space: O(n)
    func mergeKLists1(_ lists: [ListNode?]) -> ListNode? {
        return mergeKListsRecursively(lists, 0, lists.count - 1)
    }
    
    func mergeKListsRecursively(_ lists: [ListNode?], _ l: Int, _ r: Int) -> ListNode? {
        // closed range [l, r]
        guard l <= r else {
            return nil
        }
        // base case
        if l == r {
            return lists[l]
        }
        let m = l + (r - l) / 2
        // first divide the lists and merge separately
        let left = mergeKListsRecursively(lists, l, m)
        let right = mergeKListsRecursively(lists, m + 1, r)
        
        // merge left and right
        let result = mergeTwoLists(left, right)
        return result
    }
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var p1 = list1
        var p2 = list2
        var dummy: ListNode? = ListNode(-1)
        var cur = dummy
        
        while p1 != nil && p2 != nil {
            if let val1 = p1?.val, let val2 = p2?.val, val1 > val2 {
                swap(&p1, &p2)
            }
            cur?.next = p1
            p1 = p1?.next
            cur = cur?.next
        }
        cur?.next = p1 == nil ? p2 : p1
        
        return dummy?.next
    }
    
    
}
