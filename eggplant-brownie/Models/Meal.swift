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
    let items: Array<Item> = []
    
    init(name: String, happy: Int) {
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
