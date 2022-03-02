import XCTest
import Foundation

/*
    Leetcode 98: Validate BST - Med
 
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).

 A valid BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
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

extension TreeNode: Equatable {
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return (lhs.val == rhs.val) && (lhs.left == rhs.left) && (lhs.right == rhs.right)
    }
}

let a = TreeNode(2)
let b = TreeNode(5)
let c = TreeNode(3)
a.left = b
a.right = c

let e = TreeNode(5)
let f = TreeNode(2)
let g = TreeNode(6)
let h = TreeNode(1)
let i = TreeNode(7)

e.right = g
e.left = f
g.right = i
f.left = h


// Time: O(n), Space: O(n)
func isValidBST(_ root: TreeNode?, _ min: Int = Int.min, _ max: Int = Int.max) -> Bool{
    guard let root = root else { return true }
    
    return root.val > min && root.val < max && isValidBST(root.left, min, root.val) && isValidBST(root.right, root.val, max)
}

class Test:XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(isValidBST(a, Int.min, Int.max), false)
        XCTAssertTrue(isValidBST(e))
        
    }
}

Test.defaultTestSuite.run()
