import Foundation

@Observable
class Order: Codable {
    enum Codingkeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _isSpecialRequestEnabled = "isSpecialRequestEnabled"
        case _isExtraFrosting = "isExtraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _address = "address"
        case _city = "city"
        case _zip = "zip"
    }
    
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
    
    var name = ""
    var address = ""
    var city = ""
    var zip = ""
    
    var isValidAddress: Bool {
        if name.isEmpty || address.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Decimal {
        var cost = Decimal(quantity * 2)
        cost += Decimal(type) / 2
        
        if isExtraFrosting {
            cost += Decimal(quantity)
        }
        
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}
