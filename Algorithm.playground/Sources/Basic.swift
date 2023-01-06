import Foundation

public protocol BasicProtocol: AnyObject {
    associatedtype T
    associatedtype U: Equatable
    
    func allCases() -> [Solution.Cases<T, U>]
    func calculate(input: T) throws -> U
   
    // Test API
    func test() throws
    func testCase(_ caseObj: Solution.Cases<T, U>) throws
}

extension BasicProtocol {
    public func test() throws {
        Solution.printBegin("\(type(of: self))")//(NSStringFromClass(type(of: self)))
        
        _ = try allCases().map { caseEle in
           try testCase(caseEle)
        }
        
        Solution.printEnd("\(type(of: self))")
    }
    
    public func testCase(_ caseObj: Solution.Cases<T, U>) throws {
        let result = try calculate(input: caseObj.input)
        
        guard caseObj.output == result else {
            let error = SolutionErr.testFailed(caseName: caseObj.name)
            print("\(error.description)")
            Solution.printInterrupt("\(type(of: self))")
            throw error
        }
        
        Solution.casePassed(caseObj.name)
    }
}

public enum SolutionErr: Error {
    case testFailed(caseName: String)
    case abstractNotImp

    var localizedDescription: String {
        get {
            switch self {
            case .testFailed(let name):
                return "case \(name) failed ‼️"
            case .abstractNotImp:
                return "abstractNotImp"
            }
        }
    }
    
    public var description: String {
        get {
            switch self {
            case .testFailed(let name):
                return "case \(name) failed ‼️"
            case .abstractNotImp:
                return "abstractNotImp"
            }
        }
    }
}

public class Solution {
    public struct Cases<U, V> {
        var name: String
        var input:  U
        var output: V
    }
    
    public static func printBegin(_ algoName: String) {
       print("******************** BEGIN \(algoName) ********************")
    }
    
    public static func printEnd(_ algoName: String) {
       print("******************** END   \(algoName) ********************\n\n")
    }
    
    public static func printInterrupt(_ algoName: String) {
       print("******************** Failed   \(algoName)‼️ ********************\n\n")
    }
    
    public static func casePassed(_ caseName: String) {
       print("\(caseName) passed ✅")
    }
}
