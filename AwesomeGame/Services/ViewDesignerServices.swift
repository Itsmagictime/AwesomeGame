import UIKit
import SnapKit
import Foundation

enum Spacing: CGFloat {
    
    case leadingTrailing = 24
    case standart = 60
    case low = 40
    case high = 100
}
class ViewDesignerService {
    
    // MARK: - Properties
    let heightButtons: CGFloat = 40
    let heightTextFields: CGFloat = 30
    
    weak private var view: UIView?
    
    // MARK: - Initialization
    init(_ view: UIView) {
        self.view = view
    }
    
    // MARK: - Public methods
    
    public func setBottomButton(_ button: UIButton, spacingToBottom: Spacing) {
        
        guard let _ = view else {return}
        
        button.snp.makeConstraints { make in
            make.height.equalTo(heightButtons)
            make.leading.trailing.equalToSuperview().inset(Spacing.leadingTrailing.rawValue)
            make.bottom.equalToSuperview().inset(spacingToBottom.rawValue)
        }
    }
    
    public func setViewConstraints(forView: UIView, equalTopTo: UIView, spacingToView: Spacing) {
        
        guard let _ = view else {return}
        
        forView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Spacing.leadingTrailing.rawValue)
            make.top.equalTo(equalTopTo).inset(spacingToView.rawValue)
            make.height.equalTo(heightTextFields)
        }
    }
}
