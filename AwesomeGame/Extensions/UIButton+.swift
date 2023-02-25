import UIKit

extension UIButton {
    
    convenience init(title: String, backColor: UIColor, cornerRarius: CGFloat) {
        self.init()
        setTitle(title, for: .normal)
        backgroundColor = backColor
        layer.cornerRadius = 20

    }
    
    convenience init(title: String, borderColor: UIColor, borderWidth: CGFloat, cornerRarius: CGFloat) {
        self.init()
        setTitle(title, for: .normal)
        layer.cornerRadius = cornerRarius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        setTitleColor(.black, for: .normal)
    }
    
}
