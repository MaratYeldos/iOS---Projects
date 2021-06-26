//
//  ViewController.swift
//  calculator
//
//  Created by Yeldos Marat on 08.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK - Properties
    
    var firstNumber: Double = 0
    var numberFromScreen: Double = 0
    var proverka: Bool = false
    var operation: Int = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    //MARK - Lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = ""
        for i in 0..<buttons.count {
            buttons[i].layer.cornerRadius = 25
        }
    }
    
    
    //MARK - IBAction
    
    @IBAction func digits(_ sender: UIButton) {

        let sender2 = sender.tag

        if proverka == true {
            resultLabel.text! = String(sender2)
            proverka = false
        } else {
            resultLabel.text = resultLabel.text! +  String(sender2)
        }
        
        numberFromScreen = Double(resultLabel.text!)!
        
    }
    
    
    @IBAction func options(_ sender: UIButton) {
        
        let tagButtun = sender.tag
        
        if resultLabel.text! != "" && tagButtun != 10 && tagButtun != 17 {
            firstNumber = Double(resultLabel.text!)!
            if tagButtun == 13 {
                resultLabel.text = "/"
                operation = tagButtun
                proverka = true
            } else if tagButtun == 14 {
                resultLabel.text = "x"
                operation = tagButtun
                proverka = true
            } else if tagButtun == 15 {
                resultLabel.text = "-"
                operation = tagButtun
                proverka = true
            } else if tagButtun == 16 {
                resultLabel.text = "+"
                operation = tagButtun
                proverka = true
            }
        } else if tagButtun == 10 {
            resultLabel.text = ""
            firstNumber = 0
            numberFromScreen = 0
            operation = 0
        } else if tagButtun == 17 {
            if operation == 13 {
                resultLabel.text = String(firstNumber / numberFromScreen)
            } else if operation == 14 {
                resultLabel.text = String(firstNumber * numberFromScreen)
            } else if operation == 15 {
                resultLabel.text = String(firstNumber - numberFromScreen)
            } else if operation == 16 {
                resultLabel.text = String(firstNumber + numberFromScreen)
            }
        }
        
    }
    
    

}

