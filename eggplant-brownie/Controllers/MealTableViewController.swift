//
//  MealTableViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Rodrigues on 23/03/21.
//  Copyright © 2021 Paulo Rodrigues. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController, AddMealDelegate {

    var meals = [Meal(name: "Arroz", happy: 4),
                 Meal(name: "Pizza", happy: 5),
                 Meal(name: "Feijão", happy: 2)]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let meal = meals[indexPath.row]
        
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails(_:)))
        
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    func add(_ meal: Meal) {
        print("add method: \(meal.name)")
        meals.append(meal)
        
        tableView.reloadData()
    }
    
    @objc func showDetails(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            
            let meal = meals[indexPath.row]
            
            let alert = UIAlertController(title: meal.name, message: "felicidade: \(meal.happy)", preferredStyle: .alert)
            
            let buttonCancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(buttonCancel)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
        
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}
