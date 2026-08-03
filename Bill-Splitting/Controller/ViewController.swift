//
//  ViewController.swift
//  Bill-Splitting
//
//  Created by Le Gia Khanh on 21/7/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalTipUITextField: UITextField!
    @IBOutlet weak var numOfPeopleUILabel: UILabel!
    
    var tipCalculator = TipCalculator()
    
    var tipPercent: String = "0%"
    var numPeople: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func percentButtonPressed(_ sender: UIButton) {
        tipPercent = sender.titleLabel!.text!
        sender.backgroundColor = UIColor.orange
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func uiStepperPressed(_ sender: UIStepper) {
        numPeople = Int(sender.value.rounded(.down))
        numOfPeopleUILabel.text = String(format: "%d", numPeople)
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue"{
            let resultVC = segue.destination as! ResultViewController
            let totalBill = totalTipUITextField.text!
            tipCalculator.updateInfo(tipPercent: tipPercent, numPeople: numPeople)
            let tipSplit = tipCalculator.calculateTip(billAmount: totalBill, )
            resultVC.updateResultValue(billSplit: tipSplit ?? 0.0,
                                    descriptionForResult: tipCalculator.getDescription())
        }
    }
}

