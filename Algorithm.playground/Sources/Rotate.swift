import Foundation

public class Rotate: BasicProtocol {
    public struct CasesInput {
        var data: [Int]
        var k: Int
    }
    
    public typealias T = CasesInput
    
    public typealias U = [Int]
    
    public init() {
        
    }
    
    public func allCases() -> [Solution.Cases<CasesInput, [Int]>] {
        let caseOne: Solution.Cases<CasesInput, [Int]> =
        Solution.Cases.init(name: "Case One", input: CasesInput.init(data: [1,2,3,4,5,6,7], k: 3), output: [5,6,7,1,2,3,4])
        
        let caseTwo: Solution.Cases<CasesInput, [Int]> =
        Solution.Cases.init(name: "Case Two", input: CasesInput.init(data: [-1,-100,3,99], k: 2), output: [3,99,-1,-100])
        
        let caseThree: Solution.Cases<CasesInput, [Int]> =
        Solution.Cases.init(name: "Case Three", input: CasesInput.init(data: [-1], k: 2), output: [-1])
        
        return [caseOne, caseTwo, caseThree]
    }
    
    public func calculate(input: CasesInput) throws -> [Int] {
        return rotateA(input.data, input.k)
    }
   
    // Reverse Array
    func rotateA(_ nums: [Int], _ k: Int) -> [Int] {
        var result = nums
        // first: Reverse all
        result.reverse()
        
        let length = nums.count
        let moved = k % length
        // second: reverse k elements.
        var rotateEles = result.prefix(moved)
        rotateEles.reverse()
        
        // last: reverse last
        var otherEles = result.suffix(length - moved)
        otherEles.reverse()
        
        result = Array(rotateEles) + Array(otherEles)
        
        return result
    }
    
    // circle
    func rotateB(_ nums: [Int], _ k: Int) -> [Int] {
        var result = nums

        var index = 0
        let length = nums.count
    
        var hold: Int = nums[0]
        
        var visited: [Int: Bool] = [:]

        for (_, _) in result.enumerated() {
            index.skip(k, limit: length)
            
            if visited[index] == true {
                // if visited, should jump this value
                index.skip(1, limit: length)
                hold = result[index]
                
                index.skip(k, limit: length)
            }
            
            visited[index] = true
            let temp = result[index]
            result[index] = hold
            hold = temp
        }
        
        return result
    }
}

private extension Int {
    mutating func skip(_ num: Int, limit: Int) {
        self = (self + num) % limit
    }
}
