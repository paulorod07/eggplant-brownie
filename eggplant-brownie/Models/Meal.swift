//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Paulo Rodrigues on 22/03/21.
//  Copyright © 2021 Paulo Rodrigues. All rights reserved.
//

import UIKit

class Meal: NSObject {
    let name: String
    let happy: Int
    var items: Array<Item> = []
    
    init(name: String, happy: Int, items: [Item] = []) {
        self.name = name
        self.happy = happy
        self.items = items
    }
    
    func totalOfCalories() -> Double {
        var total: Double = 0.0
        
        for item in items {
            total += item.calories
        }
        
        return total
    }
}
