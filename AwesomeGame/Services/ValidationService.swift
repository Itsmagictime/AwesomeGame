import UIKit

class ValidationService {
    
    // MARK: - Properties
    let lowNumber = 1
    let highNumber = 100
    
    // MARK: - Public functions
    
    public func isValid(number: String?) -> Bool {
        guard let num = Int(number!) else {return false}
        if num >= lowNumber && num <= highNumber {
            return true
        } else {
            return false
        }
    }
    
    public func alert() -> UIAlertController {
        let alert = UIAlertController(title: "Uncorrect data", message: "Enter number from 1 to 100", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        return alert
    }
}
