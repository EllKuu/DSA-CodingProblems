import XCTest
import Foundation

/*
    Leetcode 104: Max Depth of Binary Tree - Easy
 
    Given the root of a binary tree, return its maximum depth.

    A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.


 
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

let a1 = TreeNode(3)
let b1 = TreeNode(11)
let c1 = TreeNode(4)
let d1 = TreeNode(4)
let e1 = TreeNode(2)
let f1 = TreeNode(1)
a1.left = b1
a1.right = c1
b1.left = d1
b1.right = e1
c1.right = f1

// Time: O(n), Space: O(n)
func maxDepthRecursive(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    let left = maxDepthRecursive(root.left)
    let right = maxDepthRecursive(root.right)

    return max(left, right) + 1
    
}

// Time: O(n), Space: O(n)
func maxDepthIterative(_ root: TreeNode?) -> Int{
    guard let root = root else {
        return 0
    }
    
    var stack = [(TreeNode, Int)]()
    stack.append((root, 1))
    var maxDepth = 0
    while !stack.isEmpty {
        let (node, depth) = stack.popLast()!
        maxDepth = max(depth, maxDepth)
        if let left = node.left { stack.append((left, depth + 1)) }
        if let right = node.right { stack.append((right, depth + 1))}
    }
    return maxDepth
}

maxDepthRecursive(a1)
maxDepthIterative(a1)

class Test: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(maxDepthIterative(a1), 3)
        XCTAssertEqual(maxDepthRecursive(a1), 3)
    }
}

Test.defaultTestSuite.run()
