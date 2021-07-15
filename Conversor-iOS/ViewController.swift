//
//  ViewController.swift
//  Conversor-iOS
//
//  Created by Gabriel on 14/07/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textFieldValue: UITextField!
    
    @IBOutlet weak var buttonUnit1: UIButton!
    
    
    @IBOutlet weak var buttonUnit2: UIButton!
    
    
    @IBOutlet weak var labelUnitTop: UILabel!
    
    @IBOutlet weak var labelResult: UILabel!
    
    
    @IBOutlet weak var labelUnit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showNext(_ sender: UIButton) {
        switch labelUnitTop.text! {
            case "Temperatura":
                labelUnitTop.text = "Peso"
                buttonUnit1.setTitle("Kilograma", for: .normal)
                buttonUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                labelUnitTop.text = "Moeda"
                buttonUnit1.setTitle("Real", for: .normal)
                buttonUnit2.setTitle("Dólar", for: .normal)
            case "Moeda":
                labelUnitTop.text = "Distância"
                buttonUnit1.setTitle("Metro", for: .normal)
                buttonUnit2.setTitle("Kilograma", for: .normal)
            default:
                labelUnitTop.text = "Temperatura"
                buttonUnit1.setTitle("Celsius", for: .normal)
                buttonUnit2.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == buttonUnit1 {
                buttonUnit2.alpha = 0.5
            } else {
                buttonUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch labelUnitTop.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
             
        }
        view.endEditing(true)
        let result = Double(labelResult.text!)!
        labelResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature() {
        guard let temperature = Double(textFieldValue.text!) else {return}
        if buttonUnit1.alpha == 1.0 {
            labelUnit.text = "Farenheint"
            labelResult.text = String(temperature * 1.8 + 32.0)
        } else {
            labelUnit.text = "Celsius"
            labelResult.text = String((temperature - 32.0) / 1.8)
        }
    }

    func calcDistance() {
        guard let distance = Double(textFieldValue.text!) else {return}
        if buttonUnit1.alpha == 1.0 {
            labelUnit.text = "Kilômetro"
            labelResult.text = String(distance / 1000)
        } else {
            labelUnit.text = "Metros"
            labelResult.text = String(distance * 1000)
        }
    }
    
    func calcCurrency() {
        guard let currency = Double(textFieldValue.text!) else {return}
        if buttonUnit1.alpha == 1.0 {
            labelUnit.text = "Dólar"
            labelResult.text = String(currency / 5.5)
        } else {
            labelUnit.text = "Real"
            labelResult.text = String(currency * 5.5)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(textFieldValue.text!) else {return}
        if buttonUnit1.alpha == 1.0 {
            labelUnit.text = "Libra"
            labelResult.text = String(weight / 2.2046)
        } else {
            labelUnit.text = "Kilorama"
            labelResult.text = String(weight * 2.2046)
        
     }
   }
    
    
        
}
