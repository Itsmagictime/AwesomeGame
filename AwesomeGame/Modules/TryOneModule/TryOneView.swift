import UIKit

protocol TryOneDelegate: AnyObject {
    
    func buttonTapped(_ sender: UIButton, label: UILabel)
    
}
class TryOneView: UIView {
    
    // MARK: - Properties
    
    let greaterButton = UIButton(title: ">", borderColor: .gray, borderWidth: 1, cornerRarius: 5)
    let lessButton = UIButton(title: "<", borderColor: .gray, borderWidth: 1, cornerRarius: 5)
    let equalButton = UIButton(title: "=", borderColor: .gray, borderWidth: 1, cornerRarius: 5)
    
    let tryLabel = UILabel(title: "Try № 1", alignment: .center)
    let whoGuessLabel = UILabel(title: "Computer is guessing", alignment: .center)
    let questionLabel = UILabel(title: "You number is - 50?", alignment: .center)
    let answerLabel = UILabel(title: "My number is...", alignment: .left)
    
    weak var delegate: TryOneDelegate?
    
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
    
    @objc private func buttonTapped(_ sender: UIButton, label: UILabel) {
        delegate?.buttonTapped(sender, label: questionLabel)
    }
    // MARK: - Setup views
    
    private func setupViews() {
        backgroundColor = .white

        addSubviews([lessButton, equalButton, greaterButton, tryLabel, whoGuessLabel, questionLabel, answerLabel])
        
        for button in [lessButton, equalButton, greaterButton] {
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        
    }
    // MARK: - Setup constraints
    
    private func setupConstraints() {
        
        designer.setViewConstraints(forView: tryLabel, equalTopTo: self, spacingToView: .high)
        designer.setViewConstraints(forView: whoGuessLabel, equalTopTo: tryLabel, spacingToView: .low)
        designer.setViewConstraints(forView: questionLabel, equalTopTo: whoGuessLabel, spacingToView: .standart)

        equalButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.bottom.equalToSuperview().inset(Spacing.standart.rawValue)
            make.centerX.equalTo(self.snp_centerXWithinMargins)
        }
        lessButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.bottom.equalToSuperview().inset(Spacing.standart.rawValue)
            make.right.equalTo(equalButton).inset(Spacing.standart.rawValue)
        }
        greaterButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.bottom.equalToSuperview().inset(Spacing.standart.rawValue)
            make.left.equalTo(equalButton).inset(Spacing.standart.rawValue)
        }
        answerLabel.snp.makeConstraints { make in
            make.left.equalTo(lessButton)
            make.height.equalTo(50)
            make.bottom.equalTo(lessButton.snp_topMargin)
        }
    }
}
