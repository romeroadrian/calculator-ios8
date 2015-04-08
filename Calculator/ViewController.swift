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

    var operatorStack = Array<Double>()
    
    @IBAction func enter() {
        middleOfNumber = false
        operatorStack.append(displayValue)
        print("operatorStack = \(operatorStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if middleOfNumber {
            enter()
        }
        switch operation {
            case "x": performOperation {$0 * $1}
            case "/": performOperation {$1 / $0}
            case "+": performOperation {$0 + $1}
            case "-": performOperation {$1 - $0}
            case "S": performOperation {sqrt($0)}
            default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operatorStack.count >= 2 {
            displayValue = operation(operatorStack.removeLast(), operatorStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation: Double -> Double) {
        if operatorStack.count >= 1 {
            displayValue = operation(operatorStack.removeLast())
            enter()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

