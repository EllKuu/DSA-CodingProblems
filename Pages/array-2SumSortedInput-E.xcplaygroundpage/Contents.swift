import Foundation
import XCTest

/*
 LeetCode #167 - 2 Sum II Sorted Array - Easy
 
 Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

 Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.
 
 Example:

 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
 
 Solution:
 
    1. declare a start and end pointer to specify the first and last value of the sorted array
    2. using a while loop with a condition that the start pointer must be less than the end pointer
        3. add up the values at the start and end index
            3a. if total is greater than the target you move the end pointer to the left by 1
            3b. if total is less than the target you move the start pointer to the right by 1
            3c. if total is equal to the target then return the start+1 and end+1 pointer
    4. if the loop breaks then no pair was found and return []
 
 Time: O(n)
 Space: O(1)
        
 
*/

var n = [2,7,11,15]
var t = 9

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
    var low = numbers.startIndex
    var high = numbers.endIndex - 1
    
    while low < high {
      var n = numbers[low] + numbers[high]
        if n > target{
            high -= 1
        }else if n < target{
            low += 1
        }else{
            return [low+1, high+1]
        }
    }
    
    return []
}

class testCase: XCTestCase{
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(twoSum(n, t), [1,2])
    }
    
}

testCase.defaultTestSuite.run()

