import XCTest
import Foundation

/*
    Leetcode 125: Valid Palindrome - Easy
    
    A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

    Given a string s, return true if it is a palindrome, or false otherwise.

    Examples:

    Input: s = "A man, a plan, a canal: Panama"
    Output: true
    Explanation: "amanaplanacanalpanama" is a palindrome.

    Input: s = "race a car"
    Output: false
    Explanation: "raceacar" is not a palindrome.

    Input: s = " "
    Output: true
    Explanation: s is an empty string "" after removing non-alphanumeric characters.
    Since an empty string reads the same forward and backward, it is a palindrome.

*/

/*
    Solution 1:
        - using a loop go through the string appeneding only the alphanumeric characters of the string     and create a result string.
        - the result string is then reversed and compared to see if the forward and backwards strings      match
 
    Time: O(n) - use one for loop to go through the string once
    Space: O(n) - storing the characters of the input string into a local string variable
 */
func isPalindrome1(_ s: String) -> Bool {
      var reversed = ""

      for item in s.lowercased().reversed() where item.isLetter || item.isNumber {
          reversed.append(item)
      }

      return reversed == String(reversed.reversed())
  }

/*
    Solution 2:
        - take input string and convert it to an array
        - Preprocess the elements in the array by lowercasing and filtering out alphanumeric characters
        - using a loop and two pointers we can compare the start and end indexes elements
            - if at any point the start and end elements dont match return false
            - otherwise continue until start pointer is greater than the end pointer
        - return true if loop completes
 
    Time: O(n)
    Space: O(n) - using an array to store the characters of the input string
 
 */
func isPalindrome2(_ s: String) -> Bool {
        let str = Array(s.lowercased().filter{ $0.isLetter || $0.isNumber })
        var start = 0
        var end = str.count - 1
        while start < end {
            if str[start] != str[end] {
                return false
            }
            start += 1
            end -= 1
        }

        return true
    }

/*
    Solution 3:
        - similar to solution 2 but without filtering the array
        - instead we check if the left or right pointers element is an alphanumeric character
            - if it is not a alphanumeric then we skip to the next element
            - if it is a character we check if the left and right elements match and move the pointers
            - if the left and right elements dont match we can return false
        - if loop completes than we return true
 
    Time: O(n) - using while loop to go through the array
    Space: O(n) - using an array to store the characters of the input string
 */
func isPalindrome3(_ s: String) -> Bool {
        let sArr = Array(s)
        var l = 0, r = sArr.count-1
        while l < r {
            if !sArr[l].isLetter && !sArr[l].isNumber {
                l += 1
            } else if !sArr[r].isLetter && !sArr[r].isNumber {
                r -= 1
            } else if sArr[l].uppercased() == sArr[r].uppercased() {
                l += 1
                r -= 1
            } else {
                return false
            }
        }
        return true
    }


class TestCase: XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(isPalindrome1("A man, a plan, a canal: Panama"), true)
        XCTAssertEqual(isPalindrome1("A race in space! without, a case?"), false)
        XCTAssertEqual(isPalindrome2("A man, a plan, a canal: Panama"), true)
        XCTAssertEqual(isPalindrome2("A race in space! without, a case?"), false)
        XCTAssertEqual(isPalindrome3("A man, a plan, a canal: Panama"), true)
        XCTAssertEqual(isPalindrome3("A race in space! without, a case?"), false)
    }
}

TestCase.defaultTestSuite.run()
