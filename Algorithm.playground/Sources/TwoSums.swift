import Foundation

public class TwoSums: BasicProtocol {
    public struct CasesInput {
        var data: [Int]
        var target: Int
    }
    
    public typealias T = CasesInput
    public typealias U = Array<Int>
    
    public init() {
        
    }
    
    public func allCases() -> [Solution.Cases<CasesInput, Array<Int>>] {
        let caseOne: Solution.Cases<CasesInput, [Int]> =
        Solution.Cases.init(name: "Case One", input: CasesInput.init(data: [2,7,11,15], target: 9), output: [0, 1])
        
        let caseTwo: Solution.Cases<CasesInput, [Int]> =
        Solution.Cases.init(name: "Case two", input: CasesInput.init(data: [3,2,4], target: 6), output: [1,2])
        
        let caseThree: Solution.Cases<CasesInput, [Int]> =
        Solution.Cases.init(name: "Case three", input: CasesInput.init(data: [3,3], target: 6), output: [0,1])
        
        return [caseOne, caseTwo, caseThree]
    }
    
    public func calculate(input: CasesInput) throws -> Array<Int> {
        return twoSum(input.data, input.target)
    }
    
    // 两数之和: https://leetcode.cn/problems/two-sum/solution/liang-shu-zhi-he-by-leetcode-solution/
    // Hash 算法
    public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap: [Int: Int] = [:]
        
        var results: [Int] = []
       
        for (idx, num) in nums.enumerated() {
            if let patternIdx = hashMap[target - num] {
                if idx > patternIdx {
                    results = [patternIdx, idx]
                } else {
                    results = [idx, patternIdx]
                }
                break
            }
            
            hashMap[num] = idx
        }
        
        return results
    }
}
