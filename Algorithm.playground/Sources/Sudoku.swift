import Foundation

// https://leetcode.cn/problems/valid-sudoku/
public class Sudoku: BasicProtocol {
    public typealias T = [[Character]]
    public typealias U = Bool
    
    public init() {}
    
    public func allCases() -> [Solution.Cases<[[Character]], Bool>] {
        return [testCaseA(), testCaseB()]
    }
    
    public func calculate(input: [[Character]]) throws -> Bool {
        return try isValidSudoku(input)
    }

    public func isValidSudoku(_ board: [[Character]]) throws -> Bool {
        let elements: [Int] = Array.init(repeating: 0, count: 9)
        var rows: [[Int]] = Array.init(repeating: elements, count: 9)
        var colums: [[Int]] = Array.init(repeating: elements, count: 9)
        
        let squareElements = Array.init(repeating: elements, count: 9)
        var nineBlocks: [[[Int]]] = Array.init(repeating: squareElements, count: 9)

        
        for i in 0..<9 {
            for j in 0..<9 {
                let value: String = String(board[i][j])
                
                guard value != "." else {
                    continue
                }
                
                guard let number = Int(value) else {
                    // use number
                    throw SolutionErr.testFailed(caseName: "Number not found")
                }
                
                rows[i][number - 1]+=1
                if rows[i][number - 1] > 1 {
                   return false
                }
               
                colums[j][number - 1]+=1
                if colums[j][number - 1] > 1 {
                    return false
                }
                
                nineBlocks[i/3][j/3][number - 1] += 1
                if nineBlocks[i/3][j/3][number - 1] > 1 {
                    return false
                }
            }
        }
        
        return true
    }
    
    public func testCaseA() -> Solution.Cases<[[Character]], Bool> {
        return Solution.Cases.init(name: "Case One", input: [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]], output: true)
    }
    
    public func testCaseB() -> Solution.Cases<[[Character]], Bool> {
        return Solution.Cases.init(name: "Case two", input: [["8","3",".",".","7",".",".",".","."]
                                           ,["6",".",".","1","9","5",".",".","."]
                                           ,[".","9","8",".",".",".",".","6","."]
                                           ,["8",".",".",".","6",".",".",".","3"]
                                           ,["4",".",".","8",".","3",".",".","1"]
                                           ,["7",".",".",".","2",".",".",".","6"]
                                           ,[".","6",".",".",".",".","2","8","."]
                                           ,[".",".",".","4","1","9",".",".","5"]
                                           ,[".",".",".",".","8",".",".","7","9"]], output: false)
    }
}
