//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonTen: UIButton!
    @IBOutlet weak var buttonTwenty: UIButton!
    @IBOutlet weak var buttonAddMinusSplit: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    var totalTip = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitLabel.text = "0"

    }
    
    @IBAction func addMinusPressed(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", buttonAddMinusSplit.value)
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.titleLabel?.text == "0%" {
            buttonZero.isSelected = true
            buttonTen.isSelected = false
            buttonTwenty.isSelected = false
        } else if sender.titleLabel?.text == "10%" {
            buttonZero.isSelected = false
            buttonTen.isSelected = true
            buttonTwenty.isSelected = false
        } else {
            buttonZero.isSelected = false
            buttonTen.isSelected = false
            buttonTwenty.isSelected = true
        }
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBil = Double(inputField.text ?? "0")
        let totalSplit = Double(buttonAddMinusSplit.value)
        
        if buttonZero.isSelected == true{
            totalTip = 0
        }
        else if buttonTen.isSelected == true {
            totalTip = ((totalBil ?? 0.0) * 0.1) / totalSplit
        } else {
            totalTip = ((totalBil ?? 0.0) * 0.2) / totalSplit
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalPerPerson = totalTip
            destinationVC.desc = "Split between \(Int(splitLabel.text ?? "0")!) people, with \(buttonZero.isSelected == true ? "0%" : buttonTen.isSelected == true ? "10%" : "20%") tip."
        }
    }

}

