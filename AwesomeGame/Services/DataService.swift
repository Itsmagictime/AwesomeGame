import UIKit

class DataService {
    
    // MARK: - Properties
    let lowNumber = 1
    let highNumber = 100
    
    // MARK: - Public functions
    
    public func randomNumber() -> Int {
        return Int.random(in: lowNumber...highNumber)
       
    }
}
