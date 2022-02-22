import XCTest
import Foundation

/*
 Leetcode 100: Same Tree - Easy
 
 Given the roots of two binary trees p and q, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

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

let a = TreeNode(1)
let b = TreeNode(2)
let c = TreeNode(3)
a.left = b
a.right = c

let d = TreeNode(1)
let e = TreeNode(2)
let f = TreeNode(3)
d.left = e
d.right = f

let g = TreeNode(1)
let h = TreeNode(2)
g.left = h
g.right = nil


// Time: O(n), Space: O(n)
func sameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool{
    guard let p = p, let q = q else { return p == nil && q == nil }
    
    return p.val == q.val && sameTree(p.left, q.left) && sameTree(p.right, q.right)
}


class Test:XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertTrue(sameTree(a, d))
        XCTAssertFalse(sameTree(a, g))
    }
}

Test.defaultTestSuite.run()
