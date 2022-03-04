import XCTest
import Foundation

/*
    Leetcode 102: Binary Tree Level Order Traversal - Medium
 
    Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
 
    Time: O(n), Space: O(n)
 
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

let a = TreeNode(3)
let b = TreeNode(9)
let c = TreeNode(20)
let d = TreeNode(15)
let e = TreeNode(7)

a.left = b
a.right = c
c.left = d
c.right = e

func levelOrder(_ root: TreeNode?) -> [[Int]]{
    
    guard let root = root else { return [[]] }
    
    var queue: [TreeNode] = [root]
    var result = [[Int]]()
    
    while !queue.isEmpty{
        var level = [Int]()
        var newNodes = [TreeNode]()
        for node in queue{
            level.append(node.val)
            if let leftNode = node.left { newNodes.append(leftNode) }
            if let rightNode = node.right { newNodes.append(rightNode) }
        }
        result.append(level)
        queue = newNodes
    }
    return result
}

class Test:XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(levelOrder(a), [[3], [9,20], [15,7]])
    }
}

Test.defaultTestSuite.run()
