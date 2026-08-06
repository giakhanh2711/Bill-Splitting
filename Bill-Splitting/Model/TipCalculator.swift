//
//  TipCalculator.swift
//  Bill-Splitting
//
//  Created by Le Gia Khanh on 31/7/26.
//

import Foundation

struct TipCalculator {
    
    var tipPercent: String = ""
    var numPeople: Int = 1
    
    mutating func updateInfo(tipPercent: String, numPeople: Int){
        self.tipPercent = tipPercent
        self.numPeople = numPeople
    }
    
    func calculateTip(billAmount: String) -> Float?{
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        
        if let tipPercentNumber = formatter.number(from: tipPercent){
            let totalBillAmount = Float(billAmount)! * (1 + tipPercentNumber.floatValue)
            print(tipPercentNumber, totalBillAmount)
            return totalBillAmount / Float(numPeople)
        }
        return nil
        
    }
    
    func getDescription() -> String{
        return "Split tip with \(tipPercent) among \(numPeople)"
    }
}
