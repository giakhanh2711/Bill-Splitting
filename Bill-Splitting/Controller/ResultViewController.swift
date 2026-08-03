//
//  ResultViewController.swift
//  Bill-Splitting
//
//  Created by Le Gia Khanh on 2/8/26.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var billSplitUILabel: UILabel!
    @IBOutlet weak var descriptionForResultUILabel: UILabel!
    
    var billSplit: Float = 0.0
    var descriptionForResult : String = ""
    
    func updateResultValue(billSplit:Float, descriptionForResult: String){
        self.billSplit = billSplit
        self.descriptionForResult = descriptionForResult
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        billSplitUILabel.text = String(format: "%.2f", billSplit)
        descriptionForResultUILabel.text = descriptionForResult
    }
    
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
