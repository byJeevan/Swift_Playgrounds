/*
 
 Colleen is turning 'n' years old! Therefore, she has 'n' candles of various heights on her cake, and candle 'i' has height 'height'. Because the taller candles tower over the shorter ones, Colleen can only blow out the tallest candles.
 
 Given the 'height' for each individual candle, find and print the number of candles she can successfully blow out.
 
 Input : 
 4
 3 2 1 3
 
 Output :
 2
 
 Explanation : 
 
 We have one candle of height 1, one candle of height 2, and two candles of height 3. Colleen only blows out the tallest candles, meaning the candles where height = 3. Because there are 2 such candles, we print 2 on a new line.
 
 */

var candleArr = [3,2,1,3,4,4,4,0]

var cn = candleArr.count

let n  = cn;

var tallCandle = -1;
var tcCount = 0;

for index in 0..<n {
    
    var candle = candleArr[index];
    
    if (candle > tallCandle) {
        
        tcCount = 0;
        tallCandle = candle;
        
    }
    
    if (candle == tallCandle) {
        
        tcCount = tcCount  + 1;
    }
    
}

print(tcCount);