import Foundation

public class MoveZeroes: BasicProtocol {
    public typealias T = [Int]
    public typealias U = [Int]
    
    public init() {}
    
    public func moveZeroes(_ nums: inout [Int]) {
        var slow = 0
        
        for (fast, num) in nums.enumerated() {
            if num != 0 {
                swap(&nums, x: fast, y: slow)
                slow+=1
            }
        }
    }
    
    func swap(_ nums: inout [Int], x: Int, y: Int) {
        guard x != y else {
            return
        }
        
        let temp = nums[x]
        nums[x] = nums[y]
        nums[y] = temp
    }
        
    public func allCases() -> [Solution.Cases<T, U>] {
        let caseOne: Solution.Cases<[Int], [Int]> =
        Solution.Cases.init(name: "Case One", input: [0,1,0,3,12], output: [1, 3, 12, 0, 0])
        return [caseOne]
    }
    
    public func calculate(input: T) throws ->  U {
        var input = input
        moveZeroes(&input)
        
        return input
    }
    
//    override public func test() throws {
//        try super.test()
//
//        let caseOne: Solution.Cases<[Int], [Int]> =
//        Solution.Cases.init(input: [0,1,0,3,12], output: [1, 3, 12, 0, 0])
//        try testCase(caseOne, name: "case one")
//
////        Solution.casePassed("case one")
////
////        let caseTwo: Solution.Cases<[Int], [Int]> =
////        Solution.Cases.init(input: [1,2,3], output: [1,2,4])
////        try testCase(caseTwo)
////        print("testing case 2 passed")
//    }
//
//    override func testCase(_ caseObj: Solution.Cases<[Int], [Int]>, name: String) throws {
//        try super.testCase(caseObj, name: name)
//
//        var input = caseObj.input
//        moveZeroes(&input)
//
//        guard caseObj.output == input else {
//            throw SolutionErr.testFailed(caseName: name)
//        }
//    }
}
