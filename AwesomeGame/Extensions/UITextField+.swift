import UIKit

extension UITextField {
    
    convenience init(placeHolder: String, border: BorderStyle, alignment: NSTextAlignment) {
        self.init()
        placeholder = placeHolder
        borderStyle = border
        textAlignment = alignment
    }
}
