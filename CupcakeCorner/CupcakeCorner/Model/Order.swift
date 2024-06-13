import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var isSpecialRequestEnabled = false {
        didSet {
            if isSpecialRequestEnabled == false {
                isExtraFrosting = false
                addSprinkles = false
            }
        }
    }
    var isExtraFrosting = false
    var addSprinkles = false
}
