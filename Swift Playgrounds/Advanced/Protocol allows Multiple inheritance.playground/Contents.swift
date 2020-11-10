import UIKit

//Multiple inheritance is not allowed in Swift. You can conform any protocol instead to achieve.

protocol Motion {
    func move()
}

extension Motion where Self: PetViewController {

    func move() {
        //Start moving
        print("Start moving..\n")
    }

}

class PetViewController: UIViewController, Motion {
    var isLoud: Bool?

    func speak(){
        //Open Mouth
        print("Pet Opens mouth... \n")
    }
}

//Now your classes that requires to inherit BOTH 'Motion' and 'PetViewController"
class DogViewController:PetViewController {

    func bark() {

        self.speak()

        //Make Bark Sound
        print("Barks..")
    }
}

class CatViewController: PetViewController {

    func meow() {

        self.speak()

        //Make Meow Sound
        print("Meows..")


    }

}

//....

let cat = CatViewController()
cat.move()
cat.isLoud = false
cat.meow()

//...
let dog = DogViewController()
dog.move()
dog.isLoud = false
dog.bark()
