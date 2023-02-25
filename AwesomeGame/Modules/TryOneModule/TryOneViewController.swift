import UIKit

class TryOneViewController: UIViewController, TryOneDelegate {
    
    // MARK: - Properties
    
    var number = 50
    var numberLow = 0
    var numberHigh = 100
    var isGuessed = false
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        let view = TryOneView()
        view.delegate = self
        self.view = view
        Tries.shared.computerTries += 1
    }
    
    // MARK: - Delegate functions
    
    func buttonTapped(_ sender: UIButton, label: UILabel) {
        compareNumber(sender)
        if isGuessed {
            pushVC()
        }
        label.text = "You number is - \(number)?"
    }
    
    // MARK: - Module functions
    
    private func compareNumber(_ sender: UIButton) {
        switch sender.currentTitle {
        case ">" : if Tries.shared.computerTries < 7 {greaterNumber()}
        case "<" : if Tries.shared.computerTries < 7 {lessNumber()}
        case "=" : isGuessed = true
        default : break
        }
    }
    
    private func lessNumber() {
        Tries.shared.computerTries += 1
        numberHigh = number
        number = (numberLow + numberHigh) / 2
    }
    
    private func greaterNumber() {
        Tries.shared.computerTries += 1
        numberLow = number
        number = (numberLow + numberHigh) / 2
    }
    
    private func pushVC() {
        let vc = TryTwoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
