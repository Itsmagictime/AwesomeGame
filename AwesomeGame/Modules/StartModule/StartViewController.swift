import UIKit

class StartViewController: UIViewController, StartViewDelegate {

    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        let view = StartView()
        view.delegate = self
        self.view = view
        
    }
    // MARK: - Delagate functions
    
    func startButtonTapped() {
        let guessNumberView = GuessNumberViewController()
        navigationController?.pushViewController(guessNumberView, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        Tries.shared.refresh()
    }
}

