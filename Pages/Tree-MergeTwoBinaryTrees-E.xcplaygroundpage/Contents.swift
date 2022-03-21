import Foundation

/*
    Leetcode 617: Merge Two Binary Trees - Easy
 
 You are given two binary trees root1 and root2.

 Imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not. You need to merge the two trees into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of the new tree.

 Return the merged tree.
 
 Example 1:
 Input: root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
 Output: [3,4,5,5,4,null,7]
 
 Example 2:
 Input: root1 = [1], root2 = [1,2]
 Output: [2,2]
 
    Time: O(n) - traversing all nodes of each tree
 
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
    guard let r1 = root1 else {
        return root2
    }
    guard let r2 = root2 else {
        return root1
    }
    
    var sum = 0
    var left: TreeNode?
    var right: TreeNode?
    
    sum = r1.val + r2.val
    left = mergeTrees(r1.left, r2.left)
    right = mergeTrees(r1.right, r2.right)
    
    return TreeNode(sum, left, right)
    
    
}
