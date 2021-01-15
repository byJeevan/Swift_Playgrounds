import Foundation

/// 1. Apple and Orange
/// Sam's house has an apple tree and an orange tree that yield an abundance of fruit.
/// Using the information given below, determine the number of apples and oranges that land on Sam's house.
/// [attached full problem statement[
/// Complete the countApplesAndOranges function below.
func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    let applesDistance = apples.map( { $0 + a})
    
    var totalAppleOk = 0
    applesDistance.forEach({ ad in
        if (s...t).contains(ad) {
            totalAppleOk  = totalAppleOk + 1
        }
    })
    
    print("\(totalAppleOk)")//prints number of Apples
    
    let orangeDistance = oranges.map( { $0 + b})
    
    var totalOrangeOk = 0
    orangeDistance.forEach({ od in
        if (s...t).contains(od) {
            totalOrangeOk  = totalOrangeOk + 1
        }
    })
    
    print("\(totalOrangeOk)")//prints number of Oranges
}

countApplesAndOranges(s: 7, t: 11, a: 5, b: 15, apples: [-2, 2, 1], oranges: [5, -6]) //Ans. 1 \n 1




/// 2. Kangaroo Number Line Jumps
/// You are choreographing a circus show with various animals. For one act, you are given two kangaroos on a number line ready to jump in the positive direction (i.e, toward positive infinity).
/// [attached full problem statement[
/// Complete the kangaroo function below.
func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    var multiplier = 1
    while(multiplier < 10000) {
        if (x1+(v1*multiplier) == x2+(v2*multiplier)) {
            return "YES"
        }
        
        multiplier = multiplier + 1
    }
    
    return "NO"
}


kangaroo(x1: 0, v1: 2, x2: 5, v2: 3) //"NO"


/// 3. Cats and a Mouse
/// Two cats and a mouse are at various positions on a line. You will be given their starting positions. Your task is to determine which cat will reach the mouse first, assuming the mouse does not move and the cats travel at equal speed. If the cats arrive at the same time, the mouse will be allowed to move and it will escape while they fight.
/// [attached full problem statement[
/// Complete the catAndMouse function below.
func catAndMouse(x: Int, y: Int, z: Int) -> String {
    if(abs(z-x) < abs(z-y)) { //cat A is closer
        return "Cat A"
    }
    else if abs(z-x) > abs(z-y) { //cat B is closer to mouse
        return "Cat B"
    }
    return "Mouse C"
}

catAndMouse(x: 1, y: 3, z: 2) //"Mouse C"


/// 4. Sales by Match
/// Alex works at a clothing store. There is a large pile of socks that must be paired by color for sale. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.
/// [attached full problem statement[
/// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    
    let sortedAr =  Array(ar.sorted())
    var pairscount = 0
    var index = 0
    
    while (index < n-1){
        if(sortedAr[index] == sortedAr[index+1]) {
            pairscount = pairscount + 1
            index = index + 1 //skip next index. already paired.
        }
        index = index + 1
    }
    
    return pairscount
}

sockMerchant(n: 9, ar: [10, 20, 20, 10, 10, 30, 50, 10, 20]) //3


/// 5. Alternating Characters
/// You are given a string containing characters `A` and `B` only. Your task is to change it into a string such that there are no matching adjacent characters. To do this, you are allowed to delete zero or more characters in the string.
/// Your task is to find the minimum number of required deletions.
/// Example: `s = AABAAB`
/// Remove an `A` at positions `0` and `3` to make `s = ABAB` in `2` deletions.
func alternatingCharacters(s: String) -> Int {
    var delCount = 0
    var lastChar:Character?
    
    s.forEach {
        if $0 == lastChar { delCount = delCount + 1 }
        lastChar = $0
    }
    
    return delCount
}

alternatingCharacters(s: "ABABABAB")
