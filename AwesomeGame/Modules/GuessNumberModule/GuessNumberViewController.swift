import UIKit

class GuessNumberViewController : UIViewController, GuessNumberDelegate {
    
   // MARK: - Properties
    
    let validationService = ValidationService()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        let view = GuessNumberView()
        view.delegate = self
        self.view = view
    }

    // MARK: - Delegate functions
    func enterButtonTapped(_ validateTextFiled: UITextField) {
        if validationService.isValid(number: validateTextFiled.text) {
            let vc = TryOneViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            present(validationService.alert(), animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField, toEnableButton: UIButton) {
        textField.resignFirstResponder()
        toEnableButton.alpha = 1.0
        toEnableButton.isEnabled = true
    }
    
    
}




