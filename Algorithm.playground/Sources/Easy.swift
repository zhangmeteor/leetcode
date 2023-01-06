import Foundation


public class BinarySearchSolution {
    public static func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        
        while (l < r) {
            let mid = (l + r) / 2
            if nums[mid] < target {
                l = mid + 1;
            } else {
                r = mid
            }
        }
        
        return nums[l] == target ? l : -1
    }
    
    static func checkIsNum(_ nums: [Int], _ target: Int, _ index: Int) -> Int {
        if nums[index] == target {
            return index
        }
        
        
        if nums[index] < target {
            return BinarySearchSolution.checkIsNum(nums, target, (nums.count - index) / 2)
        }
        
        if nums[index] > target {
            return BinarySearchSolution.checkIsNum(nums, target, index / 2)
        }
        
        return -1
    }
}

public class ValidParenthesesSolution {
    public static func isValid(_ s: String) -> Bool {
        var stack = Stack<String>.init(arrayLiteral: "?")
        let dic = ["{": "}",  "[": "]", "(": ")", "?": "?"]
       
        var valiad: Bool = true
        _ = s.map { character in
            let keys = Array(dic.keys)
            let str = String(character)
            if keys.contains(str) {
                print("push String:\(str)")
                stack.push(str)
            } else {
                if let pop = stack.pop() {
                    print("pop String:\(pop)")
                    if dic[pop] != str {
                        valiad = false
                        print("vailed false:\(pop) - \(str)")
                    }
                } else {
                    valiad = false
                }
            }
        }
        
        return valiad && stack.size() == 1
    }
}


public class EasySolution {
    public static func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            print("exception")
            return false
        }
  
        var copyX = x
        var reverseNum = 0
        while (copyX > reverseNum) {
            reverseNum = reverseNum * 10 + copyX % 10
            
            copyX /= 10
            print("\(copyX), \(reverseNum)")
        }
        
        return copyX == reverseNum || copyX == reverseNum / 10
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    public static func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var mergeList: ListNode? = ListNode()
      
        var cpyList1: ListNode? = list1
        var cpyList2: ListNode? = list2
        
        let head = mergeList
        
        while (cpyList1 != nil && cpyList2 != nil) {
            if cpyList1?.val ?? Int.max < cpyList2?.val ?? Int.max {
                mergeList?.next = cpyList1
                cpyList1 = cpyList1?.next
            } else {
                mergeList?.next = cpyList2
                cpyList2 = cpyList2?.next
            }
            
            mergeList = mergeList?.next
        }
        
        mergeList?.next = cpyList1 == nil ? cpyList2 : cpyList1
        
        return head?.next
    }
    
    public static func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var left = 0

        for (index, _) in nums.enumerated() {
            if nums[index] != val {
                nums[left] = nums[index]
                left += 1
            }
        }

        return left
    }
    
    public static func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        var left = 0
        var right = nums.count
        
        while left < right {
            if nums[left] == val {
                nums[left] = nums[right - 1]
                right -= 1
            } else {
                left += 1
            }
        }
        
        return left
    }
    
    public static func addBinary(_ a: String, _ b: String) -> String {
        var carry = 0
        var ans = ""
        let maxLen = max(a.count, b.count)
       
        for i in 0..<maxLen {
            var eleA = 0
            if a.count - 1 - i < a.count {
                let str = String(a[a.index(a.startIndex, offsetBy: a.count - 1 - i)])
                eleA = Int(str) ?? 0
            }
            carry += eleA
            print("carry: \(eleA)")
           
            var eleB = 0
            if b.count - 1 - i < b.count {
                let str = String(b[b.index(b.startIndex, offsetBy: b.count - 1 - i)])
                eleB = Int(str) ?? 0
            }
            carry += eleB
            print("carry: \(eleB)")
           
            ans += String(carry % 2)
            carry /= 2
            print("carry: \(carry)")
        }
        
        if carry > 0 {
            ans.append("1")
            print("carry add 1")
        }
        
        print("\(ans)")
        
        return String(ans.reversed())
    }
    
    public static func climbStairs(_ n: Int) -> Int {
        var dp: [Int] = []
        dp.append(1)
        dp.append(1)
      
        guard n >= 2 else {
            return dp[n]
        }
        
        for i in 0...n-2 {
            dp.append(dp[i - 1] + dp[i - 2])
        }
        
        return dp[n]
    }
    
    public static func containsDuplicate(_ nums: [Int]) -> Bool {
        var container: [Int: Int] = [:]
   
        var isDuplicated = false
        _ = nums.map { num in
            if container[num] != nil {
                isDuplicated = true
                return
            }
            
            container[num] = 1
        }
        
        return isDuplicated
    }
    
    public static func maxProfit(_ prices: [Int]) -> Int {
        var dp: [Int: Int] = [:]
        var minPrice = prices[0]
        var maxProfit = 0
      
        if prices.count == 0 {
            return 0
        }
        
        dp[0] = 0
       
        for i in 1..<prices.count {
            dp[i] = max(dp[i - 1] ?? 0, prices[i] - minPrice)
                        
            minPrice = min(minPrice, prices[i])
            maxProfit = max(maxProfit, dp[i] ?? 0)
        }
        
        return maxProfit
    }
    
    public static func maxProfit2(_ prices: [Int]) -> Int {
        var dp: [Int: [Int: Int]] = [:]
       
        var dayOnePrice: [Int: Int] = [:]
        dayOnePrice[0] = 0
        dayOnePrice[1] = -prices[0]
        dp[0] = dayOnePrice
       
        for i in 1..<prices.count {
            var dayPrice: [Int: Int] = [:]
            dayPrice[0] = max(dp[i - 1]?[0] ?? Int.min, (dp[i - 1]?[1] ?? Int.min) + prices[i])
            dayPrice[1] = max(dp[i - 1]?[1] ?? Int.min, (dp[i - 1]?[0] ?? Int.min) - prices[i])
            
            dp[i] = dayPrice
        }
        
        return dp[prices.count - 1]?[0] ?? 0
    }
    
    public static func longestCommonPrefix(_ strs: [String]) -> String? {
        var commonPrefix: String = strs[0]
        
        _ = strs.map { str in
            print("prefix: \(commonPrefix) - str: \(str)")
            
            commonPrefix = EasySolution.commonPrefixOperator(commonPrefix, str)
            print(commonPrefix)
        }
//        
        return commonPrefix
    }
    
    static func commonPrefixOperator(_ x: String, _ y: String) -> String {
        let minLen = min(x.count, y.count)
//
        var commonPrefix = ""
        for i in 0..<minLen {
            if x[x.index(x.startIndex, offsetBy: i)] == y[y.index(y.startIndex, offsetBy: i)] {
                commonPrefix.append(String(x[x.index(x.startIndex, offsetBy: i)]))
            } else {
                break
            }
        }
        
        return commonPrefix
    }
    
    public static func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var cur: Int
        var tail = m + n - 1
      
        while p1 >= 0 || p2 >= 0 {
            if p1 == -1 {
                cur = nums2[p2]
                print("p1")
                p2 -= 1
            } else if p2 == -1 {
                cur = nums1[p1]
                print("p2")
                p1 -= 1
            } else if nums1[p1] > nums2[p2] {
                cur = nums1[p1]
                print("upper")
                p1 -= 1
            } else {
                cur = nums2[p2]
                print("lower")
                p2 -= 1
            }
           
            nums1[tail] = cur
            tail -= 1
        }
    }
    
    public static func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, { lastNum, num in
            lastNum ^ num
        })
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
}
