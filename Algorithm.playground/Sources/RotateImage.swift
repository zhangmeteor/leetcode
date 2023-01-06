import Foundation

public class RotateImage: BasicProtocol {
    public typealias T = [[Int]]
    public typealias U = [[Int]]
    
    public init() {}

    public func allCases() -> [Solution.Cases<[[Int]], [[Int]]>] {
        let testCaseA = Solution.Cases.init(name: "Case One", input: [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]], output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]])
        let testCaseB = Solution.Cases.init(name: "Case Two", input: [[1,2,3],[4,5,6],[7,8,9]], output: [[7,4,1],[8,5,2],[9,6,3]])
        return [testCaseA, testCaseB]
    }
   
    // Method A: 归纳总结
    public func calculateB(input: [[Int]]) throws -> [[Int]] {
        var t = input
        let n = t.count
        for i in 0..<n / 2 {
            for j in 0..<(n + 1)/2 {
                let temp = t[i][j]
                t[i][j] = t[n - j - 1][i]
                t[n - j - 1][i] = t[n - i - 1][n - j - 1]
                t[n - i - 1][n - j - 1] = t[j][n - i - 1]
                t[j][n - i - 1] = temp
            }
        }
        
        return t
    }
   
    // Method B: 翻转
    // 水平轴旋转 + 主对角线旋转
    public func calculate(input: [[Int]]) throws -> [[Int]] {
        var t = input
        let n = t.count
        
        // 水平旋转
        t.reverse()
        
        // 主角线旋转
        for i in 0..<n {
            var j = 0
            while j < i {
                swap(&t, source: (i, j), other: (j, i))
                j+=1
            }
        }
        
        return t
    }
    
    fileprivate func swap(_ t: inout [[Int]], source: (Int, Int), other: (Int, Int)) {
        let temp = t[other.0][other.1]
        
        t[other.0][other.1] = t[source.0][source.1]
        t[source.0][source.1] = temp
    }
}
