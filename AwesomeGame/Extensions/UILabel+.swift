import UIKit

extension UILabel {
    
    convenience init(title: String, alignment: NSTextAlignment) {
        self.init()
        text = title
        textAlignment = alignment
    }
}
