// LeetCode: https://leetcode.com/problems/find-k-closest-elements/

import XCTest

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        guard arr.count > 0 else { return [] }
        
        var start = 0
        var end = arr.count-1
        while start <= end {
            let mid = start + (end-start)/2
            if arr[mid] == x {
                end = mid
                start = mid
                break
            } else if arr[mid] > x {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        var output = [Int]()
        var i = end
        var j = end+1
        var count = k
        while i > end-k, i > 0, j < arr.count, j < end + k, count > 0 {
            if arr[j] - x < x - arr[i] {
                count -= 1
                j += 1
            } else {
                i -= 1
                count -= 1
            }
        }
        
        while count > 0 {
            if i >= 0 {
                i -= 1
            } else if j < arr.count {
                j += 1
            }
            count -= 1
        }
        
        for k in i+1...j-1 {
            output.append(arr[k])
        }
        
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1, 2, 3, 4, 5], 4, 3)
        let expected = [1, 2, 3, 4]
        XCTAssertEqual(expected, s.findClosestElements(input.0, input.1, input.2))
    }

    func testSample2() {
        let input = ([1], 1, 1)
        let expected = [1]
        XCTAssertEqual(expected, s.findClosestElements(input.0, input.1, input.2))
    }
    
    func testSample3() {
        let input = ([0,1,1,1,2,3,6,7,8,9], 9, 4)
        let expected = [0,1,1,1,2,3,6,7,8]
        XCTAssertEqual(expected, s.findClosestElements(input.0, input.1, input.2))
    }
    
    func testSample4() {
        let input = ([0,0,0,1,3,5,6,7,8,8], 2, 2)
        let expected = [1,3]
        XCTAssertEqual(expected, s.findClosestElements(input.0, input.1, input.2))
    }
    
    func testSample5() {
        let input = ([0,0,1,2,3,3,4,7,7,8], 3, 5)
        let expected = [3, 3, 4]
        XCTAssertEqual(expected, s.findClosestElements(input.0, input.1, input.2))
    }
}

Tests.defaultTestSuite.run()
