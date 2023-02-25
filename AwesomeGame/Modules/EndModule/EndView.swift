import UIKit

protocol EndViewDelegate: AnyObject {
    
    func mainMenuButtonTapped()
    
}
class EndView: UIView {
    
    // MARK: - Properties
    
    let scoreLabel = UILabel(title: "Scores:", alignment: .center)
    let humanTriesLabel = UILabel()
    let computerTriesLabel = UILabel()
    let whoWinnerLabel = UILabel(title: "", alignment: .center)
    let mainMenuButton = UIButton(title: "Main Menu", backColor: .mainBlue(), cornerRarius: 20)
    
    weak var delegate: EndViewDelegate?
    
    lazy var designer: ViewDesignerService = {
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
    
    @objc private func mainMenuButtonTapped() {
        delegate?.mainMenuButtonTapped()
    }
    
    // MARK: - Setup views
    
    private func setupViews() {
        backgroundColor = .white
        setupTries()
        addSubviews([scoreLabel, humanTriesLabel, computerTriesLabel, whoWinnerLabel, mainMenuButton])
        
        mainMenuButton.addTarget(self, action: #selector(mainMenuButtonTapped), for: .touchUpInside)
    }
    
    private func setupTries() {
        computerTriesLabel.text = "Computers's tries count: \(Tries.shared.computerTries)"
        humanTriesLabel.text = "You's tries count: \(Tries.shared.humanTries)"
        whoWinnerLabel.text = compareWhoWin(human: Tries.shared.humanTries, computer: Tries.shared.computerTries)
        
    }
    
    private func compareWhoWin(human: Int, computer: Int) -> String {
        if human < computer { return "You Win" }
        if human == computer { return "We have a Draw" }
        if human > computer { return "Computer Win" }
        return ""
    }
    
    
    // MARK: - Setup constraints
    
    private func setupConstraints() {
        designer.setBottomButton(mainMenuButton, spacingToBottom: .standart)
        designer.setViewConstraints(forView: scoreLabel, equalTopTo: self, spacingToView: .high)
        humanTriesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Spacing.leadingTrailing.rawValue)
            make.height.equalTo(30)
            make.bottom.equalTo(self.snp_centerYWithinMargins)
        }
        computerTriesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Spacing.leadingTrailing.rawValue)
            make.height.equalTo(30)
            make.top.equalTo(humanTriesLabel.snp_bottomMargin).inset(Spacing.standart.rawValue)
        }
        whoWinnerLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Spacing.leadingTrailing.rawValue)
            make.bottom.equalTo(mainMenuButton).inset(Spacing.high.rawValue)
        }
    }
}
