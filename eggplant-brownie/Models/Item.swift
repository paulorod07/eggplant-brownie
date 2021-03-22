//
//  Item.swift
//  eggplant-brownie
//
//  Created by Paulo Rodrigues on 22/03/21.
//  Copyright © 2021 Paulo Rodrigues. All rights reserved.
//

import UIKit

class Item: NSObject {
    let name: String
    let calories: Double
    
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
}
