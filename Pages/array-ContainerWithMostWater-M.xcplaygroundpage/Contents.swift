import XCTest
import Foundation

/*
 Leetcode 11: Container with most water
 
    Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

    Notice that you may not slant the container.

 Example:
 
 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 
 
    Solution:
        - Solving for the largest area of a rectangle
            - use two pointers at the start and end of the array
            - three variables for maxArea, length and height
            
            - use a while loop that continues while start is not equal to the end pointer
                - find the min height value between the start and end as the smaller            value is our limiting height value
                - The length is calculated by subtracting the end and start index values
                - find the max area by calculating length x height and comparing it to          the value in maxArea
                - decide which pointer to move by keeping the largest height value and          moving the pointer of the smaller height value
                    - length decreases as one of the pointers is moved
            - return the maxArea of the container
 
    Time: O(n)
        - we are going through the array once using two pointers O(n/2). We can drop the /2 and get O(n)
    Space: O(1)
        - no extra space is being used.
 
 
 */

let height = [1,8,6,2,5,4,8,3,7]

func maxArea(_ height: [Int]) -> Int {
       
        var startIdx = height.startIndex
        var endIdx = height.endIndex-1
        var maxArea = 0
        
        if height.count < 2 {
            return 0
        }
        
        while startIdx != endIdx{
            let minHeight = min(height[startIdx], height[endIdx])
            var length = endIdx - startIdx
            maxArea = max(maxArea, minHeight * length)

            if height[startIdx] < height[endIdx]{
                startIdx += 1
                length -= 1
            }else{
                endIdx -= 1
                length -= 1
            }
        }
    return maxArea
}

class TestCase: XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(maxArea(height), 49)
    }
}

TestCase.defaultTestSuite.run()
