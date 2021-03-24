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

class ViewController: UIViewController {
    
    var delegate: AddMealDelegate?
    
    @IBOutlet var textFieldName: UITextField?
    @IBOutlet var textFieldHappy: UITextField?
    
    @IBAction func addValue(_ sender: Any) {
        if let mealName = textFieldName?.text, let mealHappy = textFieldHappy?.text {
            let name = mealName

            if let happy = Int(mealHappy) {
                let meal = Meal(name: name, happy: happy)

                print("Comi \(meal.name) e fiquei com felicidade \(meal.happy)")
                
                delegate?.add(meal)
                
                navigationController?.popViewController(animated: true)
            } else {
                print("Erro ao tentar criar a refeição")
            }
        }
        
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

