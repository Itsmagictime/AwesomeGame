import UIKit

class TryTwoViewController: UIViewController, TryTwoDelegate {
    
    // MARK: - Properties
    
    var number = 0
    let validationService = ValidationService()
    let dataService = DataService()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        let view = TryTwoView()
        view.delegate = self
        self.view = view
        number = dataService.randomNumber()
        print("Computer number is \(number)")
        showCongratulation()
    }
    // MARK: - Delegate functions
    
    func textFieldShouldReturn(_ textField: UITextField, button: UIButton, answerLabel: UILabel) {
        button.alpha = 1.0
        button.isEnabled = true
        textField.resignFirstResponder()
        answerLabel.text = ""
    }
    
    func guessButtonTapped(_ sender: UIButton, _ validateTextFiled: UITextField, answerLabel: UILabel) {
        if validationService.isValid(number: validateTextFiled.text)  {
            Tries.shared.humanTries += 1
            compareNumber(validateTextFiled, answerLabel: answerLabel)
            sender.alpha = 0.5
            sender.isEnabled = false
        } else {
            present(validationService.alert(), animated: true)
        }
    }
    // MARK: - Module functions
    
    private func compareNumber(_ textField: UITextField, answerLabel: UILabel) {
        if let num = Int(textField.text!) {
            if num > number {
                DispatchQueue.main.async {
                    sleep(1)
                    answerLabel.text = "No, my number if less then yours"
                    }
                }
            if num < number {
                DispatchQueue.main.async {
                    sleep(1)
                    answerLabel.text = "No, my number if greater then yours"
                }
            }
            if num == number { pushVC() }
        }
    }
    
    private func pushVC() {
        let vc = EndViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showCongratulation() {
        let alert = UIAlertController(title: "Great!", message: "Now it's your turn", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
}
