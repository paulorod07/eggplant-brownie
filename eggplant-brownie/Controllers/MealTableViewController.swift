//
//  MealTableViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Rodrigues on 23/03/21.
//  Copyright © 2021 Paulo Rodrigues. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    let meals = [Meal(name: "Arroz", happy: 4), Meal(name: "Pizza", happy: 5), Meal(name: "Feijão", happy: 2)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let meal = meals[indexPath.row]
        
        cell.textLabel?.text = meal.name
        
        return cell
    }
}