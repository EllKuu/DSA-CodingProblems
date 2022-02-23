import Foundation

/*
    Leetcode 226: Invert a Binary Tree - Easy
 
    Given the root of a binary tree, invert the tree, and return its root.
 
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
func invertTree(_ root: TreeNode?) -> TreeNode? {
        
        guard let root = root else { return nil}
        
        var tmpL = root.left
        var tmpR = root.right
        root.left = tmpR
        root.right = tmpL
        invertTree(root.left)
        invertTree(root.right)
        
        return root
        
}
