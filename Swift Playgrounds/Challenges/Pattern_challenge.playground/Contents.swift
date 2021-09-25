/*
 
 Problem Statement:
 
 Write a program that prints a staircase of size n.
  Observe that its base and height are both equal to n, and the image is drawn using `#` symbols and spaces. The last line is not preceded by any spaces.

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


func makePatternOf(_ size: Int) {

    var str = ""
    for index in (0..<size) {
        
        let stop = size-index-1;
        for _ in 0..<stop  {
            str.append(" ");
        }
        
        for _ in 0...index  {
            str.append("#");
        }
        print(str)
        str = ""
    }
}

makePatternOf(6)
