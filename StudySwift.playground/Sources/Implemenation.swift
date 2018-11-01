import Foundation

public class Implementation: Study {
    
    public init() {}
    
    public func run() {
        let exec = 2
        switch exec {
        case 1:
            execBeautifulDaysAtTheMovies()
        case 2:
            execViralAdvertising()
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
}
