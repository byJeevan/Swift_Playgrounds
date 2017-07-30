/*
 
 Question :
 
 Write a program that prints a staircase of size n.
  Observe that its base and height are both equal to n, and the image is drawn using # symbols and spaces. The last line is not preceded by any spaces.

 Note: The last line must have spaces in it.
 
 Input :
 
 6
 
 Output :
 
      #
     ##
    ###
   ####
  #####
 ######
 
 */

import Foundation

let n = 6

var str = ""

for index in (0..<n) {
    
    let stop = n-index-1;
    
    for kindex in 0..<stop  {
        
        str.append(" ");
        
    }
    
    
    for kindex in 0...index  {
        
        str.append("#");
        
        
    }
    
    
    print(str)
    
    str = ""
    
}
