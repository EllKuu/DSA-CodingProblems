import XCTest
import Foundation

/*
     Leetcode 5: Longest Palindromic Substring
 
     Given a string s, return the longest palindromic substring in s.

     Example 1:

     Input: s = "babad"
     Output: "bab"
     Explanation: "aba" is also a valid answer.
     Example 2:

     Input: s = "cbbd"
     Output: "bb"
 
 */
/*
    Solution: Expand from middle
        - we use an element in the string as middle point of a palindrome and expand left and right checking if the characters on either side match
        - for even cases we check that two middle characters are the same and expand left and right from those characters
        - compare the lengths of the odd and even cases and take the longer of the two
 
    Time: O(n^3)
        - using nested loops
        - the res = Array(str[l...r]) is possibly copying over all the characters
    Space: O(n)
 */

func longestPalindrome(_ s: String) -> String{
    var res = [Character]()
    var resLen = 0
    let str = Array(s)
    
    for i in 0..<str.count{
        //odd length
        var l = i, r = i
        while l >= 0 && r < s.count && str[l] == str[r]{
            if (r - l + 1) > resLen{
                res = Array(str[l...r])
                resLen = r - l + 1
            }
            l -= 1
            r += 1
        }
        
        //even length
        l = i
        r = i + 1
        while l >= 0 && r < s.count && str[l] == str[r]{
            if (r - l + 1) > resLen{
                res = Array(str[l...r])
                resLen = r - l + 1
            }
            l -= 1
            r += 1
        }
    }
    return String(res)
}

/*
    slight optimization instead of copying over the characters in the while loops, store the left and right index in variables and only update them if a larger length palindrome is found. Then at the end return a string using the left and right indexs to splice the string from those positions. That will make the time O(n^2) instead of O(n^3) as we no longer have another nested O(n) time within our nested loops. 
 */
func longestPalindrome1(_ s: String) -> String{
    var resLen = 0
    var resLenLeft = 0
    var resLenRight = 0
    let str = Array(s)
    
    for i in 0..<str.count{
        //odd length
        var l = i, r = i
        while l >= 0 && r < s.count && str[l] == str[r]{
            if (r - l + 1) > resLen{
                resLenLeft = l
                resLenRight = r
                resLen = r - l + 1
            }
            l -= 1
            r += 1
        }
        
        //even length
        l = i
        r = i + 1
        while l >= 0 && r < s.count && str[l] == str[r]{
            if (r - l + 1) > resLen{
                resLenLeft = l
                resLenRight = r
                resLen = r - l + 1
            }
            l -= 1
            r += 1
        }
    }
    return String(Array(str[resLenLeft...resLenRight]))
}

class TestCase: XCTestCase{
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(longestPalindrome("a"), "a")
        XCTAssertEqual(longestPalindrome("babad"), "bab")
        XCTAssertEqual(longestPalindrome("baabad"), "baab")
        XCTAssertEqual(longestPalindrome("cbbd"), "bb")
        
        XCTAssertEqual(longestPalindrome1("a"), "a")
        XCTAssertEqual(longestPalindrome1("babad"), "bab")
        XCTAssertEqual(longestPalindrome1("baabad"), "baab")
        XCTAssertEqual(longestPalindrome1("cbbd"), "bb")
    }
}

TestCase.defaultTestSuite.run()
