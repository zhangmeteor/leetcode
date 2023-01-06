import Foundation

public class ReverseStringSolution {
    public static func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        
        for i in 0...(s.count/2) {
            s.swapAt(left, right)
   
            left += 1
            right -= 1
        }
    }
}


public class RunningSumSolution {
    public func runningSum(_ nums: [Int]) -> [Int] {
        var sum = 0
        return nums.map { num in
            sum = sum + num
            return sum
        }
    }
}


