//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Paulo Rodrigues on 16/05/21.
//  Copyright © 2021 Paulo Rodrigues. All rights reserved.
//

import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }

    func show(title: String = "Atenção", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
