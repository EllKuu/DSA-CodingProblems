import XCTest
import Foundation

/*
    Leetcode #121 - Best time to buy and sell stock - Easy
 
    You are given an array prices where prices[i] is the price of a given stock on the ith day.

    You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

    Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 
 Example:

 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 
 Solution:
 
 - keep track of max total and the lowest value
 - use a loop to go through the array
    - check the low value against the current value and take the lowest of the two
    - check the max value against the current value minus the low value and take the higher of the two
 - return max value found
 
 Time: O(n)
 Space: O(1)
 
 */

let prices = [7,1,5,3,6,4]

func maximumProfit(_ prices: [Int]) -> Int{
    var max = 0
    var low = prices[0]
    
    for price in prices{
        low = price < low ? price : low
        max = price - low > max ? price - low : max
    }
    
    return max
}

class TestCase: XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test(){
        XCTAssertEqual(maximumProfit(prices), 5)
    }
    
}

TestCase.defaultTestSuite.run()
