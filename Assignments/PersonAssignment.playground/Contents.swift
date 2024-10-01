import Cocoa

import Foundation

class Person {
    let name: String
    var car: Car?

    init(name: String) {
        self.name = name
        print("\(name) initialized")
    }
}

class Car {
    let model: String
    weak var driver: Person?
    
    lazy var printCarsModelAction: () -> Void = { [weak self] in
        guard let self = self else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            print(self.model)
        }
    }
    
    init(model: String) {
        self.model = model
        print("\(model) initialized")
    }
}

let person = Person(name: "Mekhak")
let car = Car(model: "BMW")

car.driver = person
person.car = car

car.printCarsModelAction()
