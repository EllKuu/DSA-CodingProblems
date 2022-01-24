import Foundation
import XCTest

/*
 LeetCode #1 - 2Sum - Easy
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that
 they add up to target.
 
 Example:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

 
 Solution:
 Use a dictionary to store values we have previously seen
 
 1. declare an empty dictionary
 2. loop through the array getting both the index and number
    2a. calculate the difference between the target and current number
    2b. check if difference is present in the dictionary
        3. if yes then return the index values
        4. if no then we add the number and its index to the dictionary
 5. If no pair of numbers is found return an empty array
 
    // The key is a number from the array and the value is the index where it appears.
    
    var dictionary = [Int:Int]()
    for (idx, num) in nums.enumerated(){
        let diff = target - num
        if let n = dictionary[diff]{
            return [idx, n]
        }
        dictionary[num] = idx
    }
    return []
 
 Run Time: O(n) - we loop through the array in one pass
 Space: O(n) - we create a dictionary to store key:value pairs
 
 */


var nums = [1, 3, 4, 5, 2]
var target = 8

func twoSum(_ nums: [Int], _ target: Int) -> [Int]{
    var map = [Int: Int]()
    
    for (i,n) in nums.enumerated(){
        let diff = target - n

        if let j = map[diff]{
            print("i: \(i) , j: \(j)")
            return [i,j]
        }
        map[n] = i
    }
    return []
}

class testcase: XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(twoSum(nums, target), [3,1])
    }
}

testcase.defaultTestSuite.run()



