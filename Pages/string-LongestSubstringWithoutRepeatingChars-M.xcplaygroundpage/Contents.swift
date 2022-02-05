import XCTest
import Foundation

/*
    Leetcode 3: Longest Substring without repeating characters - Medium
 
    Given a string s, find the length of the longest substring without repeating characters.

     Example 1:

     Input: s = "abcabcbb"
     Output: 3
     Explanation: The answer is "abc", with the length of 3.
     Example 2:

     Input: s = "bbbbb"
     Output: 1
     Explanation: The answer is "b", with the length of 1.
     Example 3:

     Input: s = "pwwkew"
     Output: 3
     Explanation: The answer is "wke", with the length of 3.
     Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
    Solution:
        - we keep track of our strings characters and the index value in a map
 
        - as we loop through the string we check if that element is in our map
            - if it is it means we've seen it and we have to adjust the start pointer to increment up by 1
        - otherwise we can calculate our current max length by finding the difference between our current index and     starting pointer adding 1 to account for the zero index
        - we always add the character and its index to our map
 
    Time: O(n)
    Space: O(n)
 
 */

func LongestNonRepeatingSubstring(_ s:String) -> Int {
    
    guard !s.isEmpty else { return 0}
    
    var map = [Character : Int]()
    var maxLen = 0
    var startPointer = 0
    
    for (i, c) in s.enumerated(){
        if let foundIdx = map[c]{
            startPointer = max(foundIdx+1, startPointer)
        }
        maxLen = max(maxLen, i - startPointer + 1)
        map[c] = i
    }
    
    return maxLen
}

class TestCase:XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(LongestNonRepeatingSubstring("abcabcbb"), 3)
        XCTAssertEqual(LongestNonRepeatingSubstring("bbbb"), 1)
        XCTAssertEqual(LongestNonRepeatingSubstring("pwwkew"), 3)
    }
}

TestCase.defaultTestSuite.run()
