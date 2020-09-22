import UIKit


///- Builder pattern : Theme builder.
protocol ThemeProtocol {
    var backgroundColor:UIColor? { get }
    var textColor:UIColor? { get }
}

class Theme : ThemeProtocol {
    var backgroundColor:UIColor?
    var textColor:UIColor?
    var weight:Int?
    typealias buildThemeClosure = (Theme) -> Void

    init(build:buildThemeClosure) {
        build(self)
    }
}

let darkTheme = Theme(build: {
    $0.backgroundColor = UIColor.black
    $0.textColor = UIColor.white
})

let lightTheme = Theme(build: {
    $0.backgroundColor = UIColor.white
    $0.textColor = UIColor.black
})

///usage in some were in your code
darkTheme.textColor
lightTheme.backgroundColor = .red

