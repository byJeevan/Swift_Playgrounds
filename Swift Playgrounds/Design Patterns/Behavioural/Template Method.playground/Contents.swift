/*
 *********************************
 Template Pattern
 Reference : http://www.oodesign.com/template-method-pattern.html
 Problem Statement : An app contains 2 screens. Each screen has got same header and footer design. Only screen content designed in individual screens.
 ********************************
*/

//Interface
protocol ScreenTemplate {
    //Abstract method
    func createContent()
    
}

//Abstract class
class AbstractScreenTemplate: ScreenTemplate {

    func makeScreen() {
        self.createHeader();
        self.createContent();
        self.createFooter();
    }
    
    func createContent() {
        assertionFailure("Your Class must implement `createContent` method! ")
    }

    private func createHeader() {
        
        print("Common Header Created")
    }
    
    private func createFooter() {
        
        print("Common Footer Created \n")
    }
}

//Concrete Class 1
class FirstScreen : AbstractScreenTemplate {
    
    func loadFirstScreen() {
        super.makeScreen();
    }
    
    override func createContent() {
        print("First Screen Specific Content.");
    }
 
}

//Concrete Class 2
class SecondScreen : AbstractScreenTemplate {
    
    func loadSecondScreen() {
        super.makeScreen();
    }
    
    override func createContent() {
        print("Second Screen Specific Content.");
    }
    
}


/* Main */

//Will create class `FirstScreen` level content along with common Header and Footer contents.
FirstScreen().loadFirstScreen();

//Do the same for 'SecondScreen' & So on...
SecondScreen().loadSecondScreen();




