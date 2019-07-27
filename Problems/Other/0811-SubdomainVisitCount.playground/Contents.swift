
import XCTest

/**
 Problem 1: The same as leetcode question: https://leetcode.com/problems/subdomain-visit-count/
 */
class Solution1 {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var dict = [String: Int]()
        for domain in cpdomains {
            let arr = domain.components(separatedBy: " ")
            let domainArr = Array(arr[1].components(separatedBy: "."))
            var length = 1
            while domainArr.count - length >= 0  {
                let str = domainArr[domainArr.count - length..<domainArr.count].joined(separator:".")
                if dict[str] != nil {
                    dict[str]! += Int(arr[0])!
                } else {
                    dict[str] = Int(arr[0])!
                }
                length += 1
            }
        }
        var output = [String]()
        for key in dict.keys {
            output.append("\(dict[key]!) \(key)")
        }
        return output
    }
}
/**
 Problem 2: Find longest continuous common history of 2 users. The question is
 similar to longest common substring: https://leetcode.com/problems/maximum-length-of-repeated-subarray/
 */
class Solution2 {
    func findLongestCommonHistory(_ userData: [[String]]) -> [String] {
        guard userData.count == 2 else { return [] }
        var sorted = userData
        for idx in 0..<sorted.count {
            sorted[idx] = sorted[idx].sorted()
        }
        // Store the index
        var output = [0, 0]
        var dp = Array(repeating: Array(repeating: [0, 0], count: userData[1].count), count: userData[0].count)
        for idx1 in 0..<userData[0].count {
            for idx2 in 0..<userData[1].count {
                if userData[0][idx1] == userData[1][idx2] {
                    var temp = [idx1, idx1]
                    if idx1 > 0, idx2 > 0, userData[0][idx1-1] == userData[1][idx2-1] {
                        temp = [dp[idx1-1][idx2-1][0], temp[1]]
                    }
                    dp[idx1][idx2] = temp
                }
                if dp[idx1][idx2][1] - dp[idx1][idx2][0] > output[1] - output[0] {
                    output = dp[idx1][idx2]
                }
            }
        }
        var arr = [String]()
        for i in output[0]...output[1] {
            arr.append(userData[0][i])
        }
        return arr
    }
}

/**
 Problem 3: Calculate the history of purchase user.
 */
class Solution3 {
    func countPurchaseHistory(_ purchasedUsers: [String], _ history: [String], _ ipAddressUser: [String]) -> [[String]] {
        var purchasedDict = [String:Bool]() // [user:didBuy]
        for user in purchasedUsers {
            purchasedDict[user] = true
        }
        var boughtRecord = [String:[String]]() // [item:ip]
        for record in history {
            let arr = record.components(separatedBy: ",")
            if boughtRecord[arr[2]] == nil {
                boughtRecord[arr[2]] = [arr[0]]
            } else {
                boughtRecord[arr[2]]!.append(arr[0])
            }
        }
        var userIPTable = [String:String]() // [ip:user]
        for ipRec in ipAddressUser {
            let arr = ipRec.components(separatedBy: ",")
            userIPTable[arr[1]] = arr[0]
        }
        var output = [[String]]()
        for key in boughtRecord.keys {
            let ips = boughtRecord[key]!
            var count = 0
            var users = [String]()
            var usersIP = [String]()
            for ip in ips {
                if let user = userIPTable[ip], let didBuy = purchasedDict[user], didBuy {
                    count += 1
                    users.append("\(ip):\(key)")
                    usersIP.append("\(user):\(ip)")
                }
            }
            if count > 0 {
                let strArr = [
                    "\(count)/\(ips.count) users bought \(key)",
                    "\(users.joined(separator: " "))",
                    "\(usersIP.joined(separator: " "))"
                ]
                output.append(strArr)
            }
        }
        print(output)
        return output
    }
}

class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()
    let s3 = Solution3()
    
    func testSample1() {
        let input = ["9001 discuss.leetcode.com"]
        let expected = [
            "9001 discuss.leetcode.com",
            "9001 leetcode.com",
            "9001 com"
        ]
        let output = s1.subdomainVisits(input)
        XCTAssertEqual(expected.count, output.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }

    func testSample2() {
        let input = ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
        let expected = [
            "901 mail.com",
            "50 yahoo.com",
            "900 google.mail.com",
            "5 wiki.org","5 org",
            "1 intel.mail.com",
            "951 com"
        ]
        let output = s1.subdomainVisits(input)
        XCTAssertEqual(expected.count, output.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func testSample3() {
        let input = [
            ["3234.html", "xys.html", "7hsaa.html"], // user1
            ["3234.html", "sdhsfjdsh.html", "xys.html", "7hsaa.html"] // user2
        ]
        let expected = ["xys.html", "7hsaa.html"]
        let output = s2.findLongestCommonHistory(input)
        XCTAssertEqual(expected.count, output.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func testSample4() {
        let input = [
            ["microsoft.com", "google.com", "sap.com", "aws.com", "yahoo.com", "166.com"], // user1
            ["3234.html", "sap.com", "microsoft.com", "google.com", "aws.com", "yahoo.com", "166.com"] // user2
        ]
        let expected = ["aws.com", "yahoo.com", "166.com"]
        let output = s2.findLongestCommonHistory(input)
        XCTAssertEqual(expected.count, output.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func testSample5() {
        let purchasedUsers = ["203948535", "56856", "b86785"]
        let history = [
            "234.64.23.123,2018.10.3,item A",
            "234.457.45.123,2018.10.3,item A",
            "34.62.34.3,2018.10.3,item B"
        ]
        let ipaddressUser = [
            "203948535,234.457.45.123",
            "74545,234.457.2345.123",
            "2347,234.64.23.123"
        ]
        let expected = [
            ["1/2 users bought item A", "234.457.45.123:item A", "203948535:234.457.45.123"]
        ]
        XCTAssertEqual(expected, s3.countPurchaseHistory(purchasedUsers, history, ipaddressUser))
    }
}

Tests.defaultTestSuite.run()
