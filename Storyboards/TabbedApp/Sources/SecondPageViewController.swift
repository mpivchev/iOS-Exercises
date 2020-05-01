//
//  SecondViewController.swift
//  TabbedAppExercise
//
//  Created by Milen Pivchev on 10.04.20.
//  Copyright © 2020 Milen Pivchev. All rights reserved.
//

import UIKit

class SecondPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Photos"
    }
}

