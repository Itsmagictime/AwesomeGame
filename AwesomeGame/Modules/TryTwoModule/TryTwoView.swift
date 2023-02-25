import UIKit

protocol TryTwoDelegate: AnyObject {
    
    func textFieldShouldReturn(_ textField: UITextField, button: UIButton, answerLabel: UILabel)
    func guessButtonTapped(_ sender: UIButton, _ validateTextFiled: UITextField, answerLabel: UILabel)
    
}

class TryTwoView: UIView {
    
    // MARK: - Properties
    
    let tryLabel = UILabel(title: "Try № 2", alignment: .center)
    let whoGuessLabel = UILabel(title: "You are guessing", alignment: .center)
    let guessTextField = UITextField(placeHolder: "Guess", border: .roundedRect, alignment: .center)
    let guessButton = UIButton(title: "Guess", backColor: .mainBlue(), cornerRarius: 20)
    let answerLabel = UILabel(title: "", alignment: .center)
    
    weak var delegate: TryTwoDelegate?
    
    private lazy var designer: ViewDesignerService = {
        return ViewDesignerService(self)
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
    
    @objc private func guessButtonTapped(_ sender: UIButton) {
        delegate?.guessButtonTapped(sender, guessTextField, answerLabel: answerLabel)
    }
    // MARK: - Setup views
    
    private func setupViews() {
        backgroundColor = .white
        guessTextField.delegate = self
        guessTextField.keyboardType = .numbersAndPunctuation
        
        addSubviews([tryLabel, whoGuessLabel, guessButton, guessTextField, answerLabel])
        
        guessButton.alpha = 0.5
        guessButton.isEnabled = false
        guessButton.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup constraints
    
    private func setupConstraints() {
        designer.setViewConstraints(forView: tryLabel, equalTopTo: self, spacingToView: .high)
        designer.setViewConstraints(forView: whoGuessLabel, equalTopTo: tryLabel, spacingToView: .low)
        guessTextField.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(Spacing.leadingTrailing.rawValue)
            make.bottom.equalTo(self.snp_centerYWithinMargins)
        }
        guessButton.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(Spacing.leadingTrailing.rawValue)
            make.top.equalTo(guessTextField).inset(Spacing.standart.rawValue)
            make.height.equalTo(designer.heightButtons)
        }
        designer.setViewConstraints(forView: answerLabel, equalTopTo: guessButton, spacingToView: .standart)
    }
}

    // MARK: - Text field delegate

extension TryTwoView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldReturn(textField, button: guessButton, answerLabel: answerLabel)
        return true
    }
}
