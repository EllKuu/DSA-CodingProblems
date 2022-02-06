import XCTest
import Foundation

/*
    Leetcode 647: Palindromic Substrings - Medium
 
     Given a string s, return the number of palindromic substrings in it.
     A string is a palindrome when it reads the same backward as forward.
     A substring is a contiguous sequence of characters within the string.
     
     Example 1:
     
     Input: s = "abc"
     Output: 3
     Explanation: Three palindromic strings: "a", "b", "c".
     Example 2:
     
     Input: s = "aaa"
     Output: 6
     Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
 */

/*
    Solution 1: Brute force
        - use a nested loop to iterate from left to right each letters different combinations and check if they are     palindromes
        - check if string is a palindrome
    
    Time: O(n^3)
        - nested loop
        - reversed func runs O(n)
    Space: O(n)
 */

func PalindromicSubstrings(_ s: String) -> Int{
    
    var numPalin = 0
    let str = Array(s)
    var sArr = [Character]()
    
    for i in 0..<str.count{
        sArr.removeAll()
        sArr.append(str[i])
        
        for j in i+1..<str.count{
            print(sArr)
            if sArr == sArr.reversed(){
                numPalin += 1
            }
            
            sArr.append(str[j])
        }
        if sArr == sArr.reversed(){
            numPalin += 1
        }
    }
    
    return numPalin
}

/*
    Solution 2:
        - we treat each letter in the string as if it were the middle of the palindrome since we know that the          letters on the left and right side of our middle letter need to match in order to be a palindrome.
        - for example
    
            aaba
           l^r
 
            - to the left of first element there is nothing and to the right there is another a therefore we know         that this cant be a palindrome as the left and right elements are not equal.
            - when we get to the third element which is 'b' if we have a left and right pointer on either side we can     see that they are both a therefore that would count as a palindrome. If we extend out our left and          right pointers again we see that the left pointer is now at the first element 'a' but the right one         goes out of bounds therefore its no longer a palindrome.
 
    Time: O(n^2)
    Space: O(n)
 
 */

func PalinSubstrings(_ s: String) -> Int{
    var res = 0
    let sArr = Array(s)
    
    for i in 0..<sArr.count{
        //checking odd number palindromes
        var left = i
        var right = i
        res += CountPalin(s, left: left, right: right)

        //checking even number palindromes
        left = i
        right = i + 1
        res += CountPalin(s, left: left, right: right)

    }
    return res
}

func CountPalin(_ s: String, left: Int, right: Int) -> Int{
    var res = 0
    let sArr = Array(s)
    var l = left
    var r = right
    while l >= 0 && r < sArr.count && sArr[l] == sArr[r] {
        res += 1
        l -= 1
        r += 1
    }
    return res
}


class TestCase : XCTestCase{
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(PalinSubstrings("aaa"), 6)
        XCTAssertEqual(PalinSubstrings("abc"), 3)
    }
}

TestCase.defaultTestSuite.run()
