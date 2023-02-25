import UIKit

class EndViewController: UIViewController, EndViewDelegate {
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        let view = EndView()
        view.delegate = self
        self.view = view
    }
    
    // MARK: - Delegate functions
    
    func mainMenuButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}
