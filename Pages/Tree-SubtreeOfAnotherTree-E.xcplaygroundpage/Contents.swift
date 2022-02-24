import Foundation

/*
    Leetcode 572: Subtree of another tree - Easy
 
    Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

    A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.
 
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

// Time: O(n), Space: O(n)
func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
   guard let s = s else { return false }
   if isTheSame(s, t) { return true }
   return isSubtree(s.left, t) || isSubtree(s.right, t)
}

func isTheSame(_ first: TreeNode?, _ second: TreeNode?) -> Bool {
   if first == nil && second == nil { return true }
   if first == nil || second == nil { return false }

   return first!.val == second!.val &&
          isTheSame(first!.left, second!.left) &&
          isTheSame(first!.right, second!.right)
}
