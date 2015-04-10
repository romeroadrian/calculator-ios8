//
//  ViewController.swift
//  Calculator
//
//  Created by Adrian Romero on 4/7/15.
//  Copyright (c) 2015 AR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var middleOfNumber = false
    var calculator = Calculator()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if middleOfNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            middleOfNumber = true
        }
        println("digit = \(digit)")
    }
    
    @IBAction func enter() {
        middleOfNumber = false
        if let result = calculator.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if middleOfNumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = calculator.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            middleOfNumber = false
        }
    }

}

