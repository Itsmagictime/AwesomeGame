class Tries {
    
    static let shared = Tries()
    
    var humanTries = 0
    var computerTries = 0
    
    func refresh() {
        humanTries = 0
        computerTries = 0
    }
}
