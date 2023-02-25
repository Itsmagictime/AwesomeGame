import UIKit

protocol StartViewDelegate: AnyObject {
    func startButtonTapped()
}

class StartView: UIView {
    
    // MARK: - Properties
    let startButton = UIButton(title: "Start New Game", backColor: .mainBlue(), cornerRarius: 20)
    let nameGameLabel = UILabel(title: "My Awesome Game", alignment: .center)
    
    weak var delegate: StartViewDelegate?
    
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
    @objc private func startButtonTapped() {
        delegate?.startButtonTapped()
    }
    
    // MARK: - Setup views
    private func setupViews() {
        backgroundColor = .white
        addSubviews([startButton,nameGameLabel])
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        designer.setBottomButton(startButton, spacingToBottom: .standart)
        designer.setViewConstraints(forView: nameGameLabel, equalTopTo: self, spacingToView: .high)
    }
}



