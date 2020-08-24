import UIKit

//Enum conform with Mutating function via Protocol
// In Example Switch Status

protocol Toggler {
   mutating func toggle()
}

enum SwitchStatus : Toggler {
   case  on, off

   mutating func toggle() { //conforms Toggler protocol
       switch(self) {
       case .on:
           self = .off
       case .off:
           self = .on
       }
   }
}

var switchStatus = SwitchStatus.off // defaults to - off
switchStatus.toggle() // on ----> Magic !
switchStatus == .on //is true
switchStatus.toggle() //off  ----> Magic !
switchStatus == .off //is true
