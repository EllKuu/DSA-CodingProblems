import XCTest
import Foundation

/*
    Leetcode #53: Max Subarray
 
    Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

    A subarray is a contiguous part of an array.

     Example:
     Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
     Output: 6
     Explanation: [4,-1,2,1] has the largest sum = 6.
 
    Solution: keep track of two values the current sum and the max sum.
 
        - loop through each value and add it to a current sum.
        - the current sum is determined by comparing to the current array value and the      sum of the previous values
            - we take the greater of the current sum and current array value.
        - we then determine the max sum by comparing the current sum value to the value      of the max sum
            - we take the greater of the two and that value becomes the new max sum
        - at the end we return the max sum value
 
    Time: O(n)
    Space: O(1)
 
 */

var a = [-2,1,-3,4,-1,2,1,-5,4]
var b = [-2,-1,-3,-1,-9,-2]

func maxSubArr(_ nums: [Int]) -> Int{
    var curSum = nums[0]
    var maxSum = nums[0]
   
    for i in 1..<nums.count {
       curSum = max(nums[i], curSum + nums[i])
       maxSum = max(maxSum, curSum)
   }
   return maxSum
}


class TestCase: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(maxSubArr(a), 6)
        XCTAssertEqual(maxSubArr(b), -1)
    }
}

TestCase.defaultTestSuite.run()
