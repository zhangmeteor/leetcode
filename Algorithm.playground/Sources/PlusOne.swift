import Foundation

public class PlusOne: BasicProtocol {
    public typealias T = [Int]
    
    public typealias U = [Int]
    
    public init() {
        
    }
    
    public func allCases() -> [Solution.Cases<[Int], [Int]>] {
        let caseOne: Solution.Cases<[Int], [Int]> =
        Solution.Cases.init(name: "Case One", input: [9], output: [1, 0])
        
        let caseTwo: Solution.Cases<[Int], [Int]> =
        Solution.Cases.init(name: "Case Two", input: [1,2,3], output: [1,2,4])
        
        return [caseOne, caseTwo]
    }
    
    public func calculate(input: [Int]) throws -> [Int] {
       return plusOne(input)
    }
    
    public func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        for (idx, digit) in digits.enumerated().reversed() {
            result[idx] = (digit + 1) % 10
            if result[idx] != 0 {
                return result
            }
        }
   
        return [1] + result
    }
}
