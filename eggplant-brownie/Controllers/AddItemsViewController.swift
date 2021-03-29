//
//  AddItemsViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Rodrigues on 28/03/21.
//  Copyright © 2021 Paulo Rodrigues. All rights reserved.
//

import UIKit

protocol AddItemsDelegate {
    func add(_ item: Item)
}

class AddItemsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var caloriesTextField: UITextField!
    
    // MARK: - Attributes
    
    var delegate: AddItemsDelegate?
    
    init(delegate: AddItemsDelegate) {
        super.init(nibName: "AddItemsViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func addItem(_ sender: Any) {
        
        // extrair valores do textField com:
        // if let
        // ou:
        // guard let
        
        guard let name = nameTextField.text, let calories = caloriesTextField.text else {
            print("guard let")
            return
            
        }
        
//        guard let calories = caloriesTextField.text else { return }
        
        if let caloriesNumber = Double(calories) {
            print("Entrou aqui")
            let item = Item(name: name, calories: caloriesNumber)

            delegate?.add(item)
            
            navigationController?.popViewController(animated: true)
        }
    }
    
}
