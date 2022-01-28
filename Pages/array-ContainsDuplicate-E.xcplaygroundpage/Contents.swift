import XCTest
import Foundation

/*
    Leetcode #217 Contains Duplicate - Easy
 
    Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
 
    Example 1:
    Input: nums = [1,2,3,1]
    Output: true
     
    Example 2:
    Input: nums = [1,2,3,4]
    Output: false
 
    Solution 1: Generate a dictionary of (Int, Bool) to keep track of values we've seen before.
    
        - loop goes through the array
        - if value is not in the array add it and set its value to true
        - if value is seen again then we the value is in the dictionary and we return true
        - if loop finishes then return false
 
    Time: O(n)
    Space: O(n)
 
    Solution 2: Use a "Set" and compare the counts of the Set to the starting array. If the counts are different then we know there was a duplicate number in the array.
 
    Time: O(1)
    Space: O(n)
 
 */

var a = [1,1,2,3,4,5]
var b = [1,2,3,4,5]

func containsDuplicates(_ nums: [Int]) -> Bool {
    var map = [Int: Bool]()
    
    for num in nums {
        if map[num] != nil{
            return true
        }else{
            map[num] = true
        }
    }
    
    return false
}

func containsDuplicateAlt(_ nums: [Int]) -> Bool{
    if Set(nums).count != nums.count{
        return true
    }
    return false
}


class TestCase: XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(containsDuplicates(a), true)
        XCTAssertEqual(containsDuplicates(b), false)
        
        XCTAssertEqual(containsDuplicateAlt(a), true)
        XCTAssertEqual(containsDuplicateAlt(b), false)
    }
}

TestCase.defaultTestSuite.run()
