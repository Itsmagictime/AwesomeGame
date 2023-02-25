import UIKit

protocol GuessNumberDelegate: AnyObject {
    
    func enterButtonTapped(_ valedateTextFiled: UITextField)
    func textFieldShouldReturn(_ textField: UITextField, toEnableButton: UIButton)
    
}

class GuessNumberView: UIView {
    
    // MARK: - Properties
    let guessTextField = UITextField(placeHolder: "Guess the number", border: .roundedRect, alignment: .center)

    let enterButton = UIButton(title: "Enter the Number", backColor: .mainBlue(), cornerRarius: 20)
    
    weak var delegate: GuessNumberDelegate?
    
    lazy private var designer: ViewDesignerService = {
        ViewDesignerService(self)
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc func enterButtonTapped(_ valedateTextFiled: UITextField) {
        delegate?.enterButtonTapped(guessTextField)
    }
    
    // MARK: - Setup views
    
    private func setupViews() {
        
        backgroundColor = .white
        
        addSubviews([guessTextField, enterButton])
        
        enterButton.alpha = 0.5
        enterButton.isEnabled = false
        enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        
        guessTextField.delegate = self
        guessTextField.keyboardType = .numbersAndPunctuation
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        designer.setViewConstraints(forView: guessTextField, equalTopTo: self, spacingToView: .high)
        designer.setBottomButton(enterButton, spacingToBottom: .standart)
    }
    
}
extension GuessNumberView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldReturn(textField, toEnableButton: enterButton)
        return true
    }
}


