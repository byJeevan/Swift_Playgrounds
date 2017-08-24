/*
 *********************************************
 Interpreter Pattern
 Reference: http://www.oodesign.com/interpreter-pattern.html
 *********************************************
 Problem Statement : 
 SENTENCE: ((true * k) + h)
 GRAMMER :
 BooleanExp ::= Constant | Variable | OrExp | AndExp | NotExp
 AndExp ::= BooleanExp ’*’ BooleanExp
 OrExp ::= BooleanExp ’+’ BooleanExp
 NotExp ::= ’~’ BooleanExp
 Variable ::= [A-z][A-z]*
 Constant ::= ’true’ | ’false’

 *********************************************/


//Protocol + Extension = Abstract class.
protocol BooleanExpression {
    func interpret(ctx:Context) -> Bool;
    
}

extension BooleanExpression {
    func interpret(ctx:Context) -> Bool {
        assertionFailure("Expression must be implemented in Concrete Class")
        return false;
    }
}

//Context - Concrete Class
public class Context {
   
    var hash:Dictionary<String, Bool> =  Dictionary()
    
    public func lookUp(variable:Variable) -> Bool {
        
        return hash[variable.localVariable]!
    }

    public func assignValue(variable:Variable , value:Bool) {
        
        self.hash.updateValue(value, forKey: variable.localVariable)
    }
}

public class Constant : BooleanExpression {
    
    var booleanValue : Bool
    
    //Constructor
    init(booleanValue:Bool) {
        self.booleanValue  = booleanValue;
    }
    
    //Concrete method
    public func interpret(ctx: Context) -> Bool {
        
        return self.booleanValue;
    }
}

public class Variable : BooleanExpression {
    
    var localVariable:String;
    
    //Constructor
    init(localVariable : String) {
        
        self.localVariable = localVariable;
    }
    
    public func interpret(ctx: Context) -> Bool{
        
        return ctx.lookUp(variable:self);
        
    }
}

public class AndExpression : BooleanExpression {

    var leftExp:BooleanExpression;
    var rightExp:BooleanExpression;
    
    //constuctor
    init(leftExp:BooleanExpression, rightExp:BooleanExpression) {
        self.leftExp = leftExp;
        self.rightExp = rightExp;
    }
    
    public func interpret(ctx: Context) -> Bool {
 
        return (leftExp.interpret(ctx:ctx) && rightExp.interpret(ctx:ctx))
    }
}

public class NotExpression : BooleanExpression {
    
    var exp:BooleanExpression;
    
    //constuctor
    init(exp:BooleanExpression) {
        self.exp = exp;
    }
    
    public func interpret(ctx: Context) -> Bool {
        return !(exp.interpret(ctx:ctx))
    }
}


public class OrExpression : BooleanExpression {
    
    var leftExp:BooleanExpression;
    var rightExp:BooleanExpression;
    
    //constuctor
    init(leftExp:BooleanExpression, rightExp:BooleanExpression) {
        self.leftExp = leftExp;
        self.rightExp = rightExp;
    }
    
    public  func interpret(ctx: Context) -> Bool {
        
        return (leftExp.interpret(ctx:ctx) || rightExp.interpret(ctx:ctx))
    }
}


/********** Main **********/
let context = Context();

let exp1 = Constant.init(booleanValue: true);
let exp2 = Variable.init(localVariable: "k");
let exp3 = Variable.init(localVariable: "h");
let exp4 = AndExpression.init(leftExp: exp1, rightExp: exp2);
let finalExp = OrExpression.init(leftExp: exp4, rightExp: exp3);

context.assignValue(variable: exp2 , value: false);
context.assignValue(variable: exp3 , value: true);

print("Final result of Expression : \(finalExp.interpret(ctx: context))")


/* Simplified version
 let k = Variable.init(localVariable: "k");
 let h = Variable.init(localVariable: "h");
 
 let finalExp = AndExpression(leftExp: Constant.init(booleanValue: true), rightExp: OrExpression.init(leftExp: k, rightExp: h))
 context.assignValue(variable: k, value: false)
 context.assignValue(variable: h, value: false)
*/









