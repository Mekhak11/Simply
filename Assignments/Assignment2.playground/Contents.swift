import Cocoa

struct Customer: Identifiable {
    var id: UUID
    var waiter: Waiter
    var order: Order
    
}

struct Waiter: Identifiable {
    var id: UUID
    var customers: [Customer] = []
    
}

struct Order: Identifiable {
    var id: UUID
    var appertizer: [Appetizer]?
    var mainCourse: [MainCourse]?
    var dessert: [Dessert]?
    var beverage: [Beverage]?
    
}

protocol Orderaable {
    var name: String { get  }
    var portion: Double { get  }
    var price: Double { get  }
}

enum Appetizer: String, Orderaable {
    
    case greek, ceasar, green
    
    var name: String {
        return self.rawValue
    }
    
    var portion: Double {
        switch self {
        case .greek:
            return 2.5
        case .ceasar:
            return 1.3
        case .green:
            return 1.0
        }
    }
    
    var price: Double {
        switch self {
        case .greek:
            return 10.0
        case .ceasar:
           return 11.3
        case .green:
           return 12.5
        }
    }
    
}

enum MainCourse: String, Orderaable {
    case pizza, pasta, chicken, fries
    
    var name: String {
        return self.rawValue
    }
    
    var portion: Double {
        switch self {
        case .pizza:
            return 6.0
        case .pasta:
            return 2.0
        case .chicken:
            return 3.0
        case .fries:
            return 1.0
        }
    }
    
    var price: Double {
        switch self {
        case .pizza:
            return 30.0
        case .pasta:
            return 20.0
        case .chicken:
            return 21.0
        case .fries:
            return 10.0
        }
    }
    
}

enum Dessert: String, Orderaable {
    case iceCream, brownie, lavaCake
    
    var name: String {
        return self.rawValue
    }
    
    var portion: Double {
        switch self {
        case .iceCream:
            return 2.0
        case .brownie:
            return 1.0
        case .lavaCake:
            return 3.0
        }
    }
    
    var price: Double {
        switch self {
        case .iceCream:
            return 10.0
        case .brownie:
            return 21.0
        case .lavaCake:
            return 15.0
        }
    }
    
    
}

enum Beverage : String, Orderaable {
    case coffee, tea, juice, soda, water, wine
    
    var name: String {
        return self.rawValue
    }
    
    var portion: Double {
        switch self {
        case .coffee:
            return 1.0
        case .tea:
            return 1.0
        case .juice:
            return 2.0
        case .soda:
            return 3.0
        case .water:
            return 1.5
        case .wine:
            return 1.0
        }
    }
    
    var price: Double {
        switch self {
        case .coffee:
            return 3.0
        case .tea:
            return 6.0
        case .juice:
            return 5.5
        case .soda:
            return 3.0
        case .water:
            return 1.0
        case .wine:
            return 10.0
        }
    }
    
}

var waiter = Waiter(id: UUID())
var customer = Customer(id: UUID(), waiter: waiter, order: Order(id: UUID(),appertizer: [.ceasar], beverage: [.juice]))
waiter.customers.append(customer)
