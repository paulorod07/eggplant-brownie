import UIKit


//func foodEated() {
//    print("O alimento consumido foi: \(name)")
//}

//func foodEated(food: String) {
//    print("O alimento consumido foi: \(food)")
//}
//
//let name = "Frango"
//
//foodEated(food: name)


//let caloria1 = 50.5
//let caloria2 = 100
//let caloria3 = 300
//let caloria4 = 500
//
//let totalDeCalorias = [50.5, 100, 300, 500, 350, 1000]

// fors

//for i in totalDeCalorias {
//    print("i => ", i)
//
//}

//for i in 0...totalDeCalorias.count - 1 {
//    print(i)
//    print(totalDeCalorias[i])
//}

// for in (mais utilizado - MAIS UTILIZADO)

//for caloria in t    otalDeCalorias {
//    print("call", caloria)
//}

//let totalDeCalorias = [50.5, 100]

// printando tipo
//print(type(of: totalDeCalorias))

//func allCalories(totalCalories: Array<Double>) -> Double {
//    var total: Double = 0.0
//
//
//    for caloria in totalCalories {
//        total += caloria
//    }
//
//    return total
//}
//
//let total = allCalories(totalCalories: [50.5, 100, 400])
//
//print(total)

//let foodName = "Batata"
//let happy = "5"
//
//let foodName2 = "Uva"
//let happy2 = "4"

// Instanciamento da classe Meal
//let meal: Meal = Meal()
//
//if meal.name != nil {
//    print(meal.name)
//}
//
//meal.name = "João"
////meal.happy = "5"
//
//// good practices to extract optional values
//
//// if let
//if let name = meal.name {
//    print(name)
//}
//
////if let happy = meal.happy {
////    print(happy)
////}
//
//// guard let
//
//func showMealName() {
//    if let name = meal.name {
//        print(name)
//    }
//
//    guard let name = meal.name else {
//        return
//    }
//
//    print(name)
//}
//
//showMealName()

class Item {
    var name: String
    var calories: Double
    
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
}

class Meal {
    var name: String
    var happy: String
    var items: Array<Item> = []
    
    init(name: String, happy: String) {
        self.name = name
        self.happy = happy
    }
    
    func totalOfCalories() -> Double {
        var total: Double = 0.0
        
        for item in items {
            total += item.calories
        }
        
        return total
    }
}

let arroz = Item(name: "Arroz", calories: 51.0)
let feijao = Item(name: "Feijao", calories: 90.0)
let contrafile = Item(name: "Contra file", calories: 287.0)

let meal = Meal(name: "Frango", happy: "5")

meal.items.append(arroz)
meal.items.append(feijao)
meal.items.append(contrafile)

print(meal.name)

if let first = meal.items.first {
    print(first.name)
}

print(meal.totalOfCalories())


