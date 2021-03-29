//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Rodrigues on 19/03/21.
//  Copyright © 2021 Paulo Rodrigues. All rights reserved.
//

import UIKit

protocol AddMealDelegate {
    func add(_ meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemsDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableViewItems: UITableView!
    
    // MARK: - Attributes
    
    var delegate: AddMealDelegate?
    
    // var items: [String] = ["Molho de tomate", "Queijo", "Molho apimentado", "Manjericão"]
    
    var items: [Item] = [Item(name: "molho de tomate", calories: 40.0),
                         Item(name: "Queijo", calories: 40.0),
                         Item(name: "Molho apimentado", calories: 40.0),
                         Item(name: "Manjericão", calories: 40.0)]
    
    var selectedItems: [Item] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet var textFieldName: UITextField?
    @IBOutlet var textFieldHappy: UITextField?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        let addItemButton = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(addItem))
        
        navigationItem.rightBarButtonItem = addItemButton
    }
    
    @objc func addItem() {
        let addItemsViewController = AddItemsViewController(delegate: self)
        
        navigationController?.pushViewController(addItemsViewController, animated: true)
    }
    
    func add(_ item: Item) {
        print("add method view contoller")
        items.append(item)
        tableViewItems.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let tableViewRow = indexPath.row
        
        let item = items[tableViewRow]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            
            let tableRow = indexPath.row
            
            selectedItems.append(items[tableRow])
        } else {
            cell.accessoryType = .none
            
            let item = items[indexPath.row]
            if let position = selectedItems.firstIndex(of: item) {
                selectedItems.remove(at: position)
                
                // Teste
                
                for selectedItem in selectedItems {
                    print(selectedItem.name)
                }
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func addValue(_ sender: Any) {
        if let mealName = textFieldName?.text, let mealHappy = textFieldHappy?.text {
            let name = mealName

            if let happy = Int(mealHappy) {
                let meal = Meal(name: name, happy: happy, items: selectedItems)
                
             //  meal.items = selectedItems

                print("Comi \(meal.name) e fiquei com felicidade \(meal.happy)")
                
                delegate?.add(meal)
                
                navigationController?.popViewController(animated: true)
            } else {
                print("Erro ao tentar criar a refeição")
            }
        }
        
        // OBS: comentário somente para lembrar que poderia ser feito desse maneira também
        
//        guard let mealName = textFieldName?.text else {
//            print("erro 1")
//            return
//        }
//
//        if mealName == "" {
//            print("comida vazia")
//            return
//        }
//
//        guard let mealHappy = textFieldHappy?.text, let happy = Int(mealHappy) else {
//            print("erro 2")
//            return
//        }
//
//        let meal = Meal(name: mealName, happy: happy)
//
//        print("Comi \(meal.name) e fiquei com felicidade \(meal.happy)")
    }
}

