import Foundation

public class Implementation: Study {
    
    public init() {}
    
    public func run() {
        let exec = 6
        switch exec {
        case 1:
            execBeautifulDaysAtTheMovies()
        case 2:
            execViralAdvertising()
        case 3:
            execSaveThePrisoner()
        case 4:
            execJumpingOnTheClouds()
        case 5:
            execCutTheSticks()
        case 6:
            execRepeatedString()
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
    
    private func execFindDigits() {
        let res1 = findDigits(n: 12)
        if res1 != 2 {
            print("Case1 Failure.. your answer = \(res1) correct = 2")
            return
        }
        let res2 = findDigits(n: 111)
        if res2 != 3 {
            print("Case2 Failure.. your answer = \(res2) correct = 3")
            return
        }
        let res3 = findDigits(n: 1012)
        if res3 != 3 {
            print("Case3 Failure.. your answer = \(res3) correct = 3")
            return
        }
        print("Success")
    }
    
    private func findDigits(n: Int) -> Int {
        var cnt = 0
        n.description.forEach {
            let num = Int($0.description)!
            if (num != 0) && (n % num == 0) {
                cnt += 1
            }
        }
        return cnt
    }
    
    private func execCutTheSticks() {
        let result1 = cutTheSticks(arr: [1,2,3])
        if result1 != [3,2,1] {
            print("case1 failure.. \(result1)")
            return
        }
        let result2 = cutTheSticks(arr: [5,4,4,2,2,8])
        if result2 != [6,4,2,1] {
            print("case2 failure.. \(result2)")
            return
        }
        let result3 = cutTheSticks(arr: [1,2,3,4,3,3,2,1])
        if result3 != [8,6,4,1] {
            print("case3 failure.. \(result3)")
            return
        }
        print("Success!!")
    }
    
    private func cutTheSticks(arr: [Int]) -> [Int] {
        var results = [Int]()
        var localArr = arr
        
        while (!localArr.isEmpty) {
            results.append(localArr.count)
            if let minVal = localArr.min() {
                localArr = localArr.map { $0 - minVal }.filter { $0 > 0 }
            } else {
                break
            }
        }
        return results
    }
    private func execRepeatedString() {
        let case1 = repeatedString(s: "abcab", n: 10)
        if case1 != 4 {
            print("case1 failure.. \(case1)")
        }
        let case2 = repeatedString(s: "aba", n: 10)
        if case2 != 7 {
            print("case2 failure.. \(case2)")
        }
        let case3 = repeatedString(s: "a", n: 1000000000000)
        if case3 != 1000000000000 {
            print("case3 failure.. \(case1)")
        }
        let case4 = repeatedString(s: "gfcaaaecbg", n: 547602)
        if case4 != 164280 {
            print("case4 failure.. \(case1)")
        }
        print("Success!")
    }
    private func repeatedString(s: String, n: Int) -> Int {
        
        func countChar(target: String) -> Int {
            return target.filter { $0 == "a" }.count
        }
        
        var result = countChar(target: s) * (n / s.count)
        if (n % s.count != 0) {
            let remainStr = s.prefix(n % s.count).description
            result += countChar(target: remainStr)
        }
        return result
    }
}
