import Foundation

public class Implementation: Study {
    
    public init() {}
    
    public func run() {
        let exec = 4
        switch exec {
        case 1:
            execBeautifulDaysAtTheMovies()
        case 2:
            execViralAdvertising()
        case 3:
            execSaveThePrisoner()
        case 4:
            execJumpingOnTheClouds()
        default:
            print("nothing run code")
        }
    }
    
    private func execBeautifulDaysAtTheMovies() {
        
        func isBeautiful(_ day: Int, _ div: Int) -> Bool {
            let reverseDayStr = String(day.description.reversed())
            let reverseDay = Int(reverseDayStr)
            return (day - reverseDay!) % div == 0
        }
        
        func countBeautifulDay(start: Int, end: Int, div: Int) -> Int {
            var count = 0
            for day in start...end {
                if isBeautiful(day, div) {
                    count += 1
                }
            }
            return count
        }
        
        let res = countBeautifulDay(start: 20, end: 23, div: 6)
        print(res)
    }
    
    private func execViralAdvertising() {
        
        func viralAdvertising(n: Int) -> Int {
            var sharedNum = 5
            var liked: Int
            var cumulative = 0
            for _ in 1...n {
                liked = sharedNum / 2
                cumulative += liked
                sharedNum = liked * 3
            }
            return cumulative
        }
        
        let res = viralAdvertising(n: 3)
        if res != 9 {
            print("case1 Failure...")
            return
        }
        let res2 = viralAdvertising(n: 5)
        if res2 != 24 {
            print("case2 Failure...")
            return
        }
        let res3 = viralAdvertising(n: 10)
        if res3 != 189 {
            print("case3 Failure...")
            return
        }
        print("Success")
    }
    
    private func execSaveThePrisoner() {
        let test1 = saveThePrisoner(n: 5, m: 2, s: 1)
        if test1 != 2 {
            print("case1 Failure...")
            return
        }
        let test2 = saveThePrisoner(n: 5, m: 11, s: 1)
        if test2 != 1 {
            print("case2 Failure...")
            return
        }
        let test3 = saveThePrisoner(n: 999999999, m: 999999999, s: 1)
        if test3 != 999999999 {
            print("case3 Failure...")
            return
        }
        print("Success")
    }
    
    private func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
        switch (n, m, s) {
        case (1, 1, _):
            return s
        case (_, _, 1) where n >= m:
            return m
        default:
            let rem = (m % n) + (s - 1)
            return (rem <= n) ? rem : rem - n
        }
    }
    
    private func execSequenceEquation() {
        
        func checkArray(ownCalc results: [Int], answers: [Int]) -> Bool {
            var success = true
            for (result, answer) in zip(results, answers) {
                if (result != answer) {
                    print("Failure! result = \(result) correct answer = \(answer)")
                    success = false
                }
            }
            return success
        }
        
        var result = sequenceEquation(p: [5, 2, 1, 3, 4])
        if !checkArray(ownCalc: result, answers: [4, 2, 5, 1, 3]) {
           return
        }
        result = sequenceEquation(p: [2, 3, 1])
        if !checkArray(ownCalc: result, answers: [2, 3, 1]) {
            return
        }
        result = sequenceEquation(p: [4, 3, 5, 1, 2])
        if !checkArray(ownCalc: result, answers: [1, 3, 5, 4, 2]) {
            return
        }
        print("Success!!")
    }
    
    private func sequenceEquation(p: [Int]) -> [Int] {
        let result = (0..<p.count).map { x in
            (p.firstIndex(of: x + 1))! + 1
        }.map { firstP in
            (p.firstIndex(of: firstP))! + 1
        }
        return result
    }
    
    private func execJumpingOnTheClouds() {
        let result = jumpingOnClouds(c: [0,0,1,0], k: 2)
        if result != 96 {
            print("Case1 Failure.. your answer = \(result) . correct answer = 96")
        }
        let result2 = jumpingOnClouds(c: [0,0,1,0,0,1,1,0], k: 2)
        if result2 != 92 {
            print("Case2 Failure.. your answer = \(result2) . correct answer = 92")
        }
        let result3 = jumpingOnClouds(c: [1,1,1,0,1,1,0,0,0,0], k: 3)
        if result3 != 94 {
            print("Case3 Failure.. your answer = \(result2) . correct answer = 94")
        }
        print("Success!")
    }
    
    private func jumpingOnClouds(c: [Int], k: Int) -> Int {
        var baseStep = c.count / k
        if c.count % k != 0 {
            baseStep += 1
        }
        var thunderCloudCount = 0
        for index in 0..<c.count {
            if (index % k == 0) && c[index] == 1 {
                thunderCloudCount += 1
            }
        }
        return 100 - (baseStep + (thunderCloudCount * 2))
    }
}
