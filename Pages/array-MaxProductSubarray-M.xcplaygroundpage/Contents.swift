import XCTest
import Foundation

/*
    Leetcode 152: Max product subarray - Medium
 
    Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.
 
    It is guaranteed that the answer will fit in a 32-bit integer.
 
    A subarray is a contiguous subsequence of the array.
 
    Example 1:
 
    Input: nums = [2,3,-2,4]
    Output: 6
    Explanation: [2,3] has the largest product 6.
     
    Example 2:
     
    Input: nums = [-2,0,-1]
    Output: 0
    Explanation: The result cannot be 2, because [-2,-1] is not a subarray
 
    Solution:
        - need to keep track of a max and min value product
        
        - declare three variables mx, mn and res all set to the first element in the array
            - currently the first element in the array is our value for all three             variables
        - use a loop to start going through the values in the array
            - declare a var for the current indexed value
            - declare a var to hold onto the previous max value
            - calculating the max value by comparing three arguments (indexed value, max      x current val, min x indexed value)
            - calculating the min value by comparing three arguments (indexed value,          previous max x current val, min x indexed value)
            - The result we are finding the max between the most recent result and the        calculated max value
    - return the result
 
    Time: O(n)
    Space: O(1)
 
 */

let nums = [2,3,-2,4]

func maxProduct(_ nums: [Int]) -> Int {
       var mx = nums[0]
       var mi = nums[0]
       var res = nums[0]
       
       for i in 1..<nums.count{
           let val = nums[i]
           let prevMx = mx
           
           mx = max(val, mx*val, mi*val)
           mi = min(val, prevMx*val, mi*val)
           res = max(res, mx)
       }
       
       return res
   }


class TestCase: XCTestCase{
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(maxProduct(nums), 6)
    }
}

TestCase.defaultTestSuite.run()
