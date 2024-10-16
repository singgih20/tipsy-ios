//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Singgih Aji Sasongko on 16/10/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var totalPerPerson = 0.0
    var desc = ""
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalLabel.text = String(totalPerPerson)
        settingLabel.text = desc
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
}
