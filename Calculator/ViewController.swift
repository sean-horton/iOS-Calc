//
//  ViewController.swift
//  Calculator
//
//  Created by shorton on 6/22/17.
//  Copyright © 2017 shorton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputLabel: UILabel!
    
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonSubtract: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDel: UIButton!
    @IBOutlet weak var buttonEquals: UIButton!
    @IBOutlet weak var buttonAdd: UIButton!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttunDecimal: UIButton!
    
    var shouldClear = false
    var commands = [Any]()
    
    let plus = "+"
    let multiply = "x"
    let divide = "/"
    let subtract = "-"
    let decimal = "."
    
    // colors
    let borderColor = UIColor(red:102/255.0, green:102/255.0, blue:102/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputLabel.text = " "
        
        // Buttons 1 - 9
        button0.addTarget(self, action: #selector(self.button0Pressed), for: .touchUpInside)
        button1.addTarget(self, action: #selector(self.button1Pressed), for: .touchUpInside)
        button2.addTarget(self, action: #selector(self.button2Pressed), for: .touchUpInside)
        button3.addTarget(self, action: #selector(self.button3Pressed), for: .touchUpInside)
        button4.addTarget(self, action: #selector(self.button4Pressed), for: .touchUpInside)
        button5.addTarget(self, action: #selector(self.button5Pressed), for: .touchUpInside)
        button6.addTarget(self, action: #selector(self.button6Pressed), for: .touchUpInside)
        button7.addTarget(self, action: #selector(self.button7Pressed), for: .touchUpInside)
        button8.addTarget(self, action: #selector(self.button8Pressed), for: .touchUpInside)
        button9.addTarget(self, action: #selector(self.button9Pressed), for: .touchUpInside)
        
        buttonAdd.addTarget(self, action: #selector(self.buttonPlusPressed), for: .touchUpInside)
        buttonMultiply.addTarget(self, action: #selector(self.buttonMultiplyPressed), for: .touchUpInside)
        buttonSubtract.addTarget(self, action: #selector(self.buttonSubtractPressed), for: .touchUpInside)
        buttonDivide.addTarget(self, action: #selector(self.buttonDividePressed), for: .touchUpInside)
        buttunDecimal.addTarget(self, action: #selector(self.buttonDecimalPressed), for: .touchUpInside)
        
        buttonEquals.addTarget(self, action: #selector(self.buttonEqualsPressed), for: .touchUpInside)
        buttonDel.addTarget(self, action: #selector(self.buttonDelPressed), for: .touchUpInside)
        
        // set colors
        setNumberColor(button: button0)
        setNumberColor(button: button1)
        setNumberColor(button: button2)
        setNumberColor(button: button3)
        setNumberColor(button: button4)
        setNumberColor(button: button5)
        setNumberColor(button: button6)
        setNumberColor(button: button7)
        setNumberColor(button: button8)
        setNumberColor(button: button9)
        setNumberColor(button: buttunDecimal)
        setNumberColor(button: buttonEquals)
        
        setOperatorColor(button: buttonDel)
        setOperatorColor(button: buttonAdd)
        setOperatorColor(button: buttonMultiply)
        setOperatorColor(button: buttonDivide)
        setOperatorColor(button: buttonSubtract)
    }

    func setBorderColor(button: UIButton) {
        button.layer.borderWidth = 0.5
        button.layer.borderColor = borderColor.cgColor
    }
    
    func setNumberColor(button: UIButton) {
        button.backgroundColor = .clear
        setBorderColor(button: button)
    }
    
    func setOperatorColor(button: UIButton) {
        setBorderColor(button: button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkClear() {
        if shouldClear {
            inputLabel.text = " "
            shouldClear = false
        }
    }
    
    // MARK: Int buttons
    func button0Pressed() {
        addNumber(num: 0)
    }
    
    func button1Pressed() {
        addNumber(num: 1)
    }
    
    func button2Pressed() {
        addNumber(num: 2)
    }
    
    func button3Pressed() {
        addNumber(num: 3)
    }
    
    func button4Pressed() {
        addNumber(num: 4)
    }
    
    func button5Pressed() {
        addNumber(num: 5)
    }
    
    func button6Pressed() {
        addNumber(num: 6)
    }
    
    func button7Pressed() {
        addNumber(num: 7)
    }
    
    func button8Pressed() {
        addNumber(num: 8)
    }
    
    func button9Pressed() {
        addNumber(num: 9)
    }
    
    func addNumber(num: Int) {
        checkClear()
        commands.append(num)
        inputLabel.text?.append(String(num))
    }
    
    func buttonDecimalPressed() {
        checkClear()
        if commands.last as? String != decimal {
            commands.append(decimal)
            inputLabel.text?.append(decimal)
        }
    }
    
    // MARK: Operators
    func buttonPlusPressed() {
        addOperator(op: plus)
    }
    
    func buttonMultiplyPressed() {
        addOperator(op: multiply)
    }
    
    func buttonSubtractPressed() {
        addOperator(op: subtract)
    }
    
    func buttonDividePressed() {
        addOperator(op: divide)
    }
    
    func addOperator(op: String) {
        checkClear()
        if commands.count > 0 {
            
            // if last item is a operator replace it with the new operator  
            if let lastCommand = commands.last as? String {
                if lastCommand != op {
                    commands.removeLast()
                    commands.append(op)
                    
                    if let name = inputLabel.text {
                        inputLabel.text = name.substring(to: name.index(before: name.endIndex))
                        inputLabel.text?.append(op)
                    }
                }
            } else {
                commands.append(op)
                inputLabel.text?.append(op)
            }
            
        }
    }
    
    // MARK: Equals and Del
    func buttonEqualsPressed() {
        var input = "0"
        var sum = 0.0
        var finalCommands = [Any]()
        
        // Loop through commands and build a new list with full numbers
        for any in commands {
            if let num = any as? Int {
                input.append(String(num))
            } else if any is String && any as! String == decimal {
                input.append(decimal)
            } else {
                finalCommands.append(Double(input)!)
                finalCommands.append(any)
                input = "0"
            }
        }
        finalCommands.append(Double(input)!)
        
        var hasStarted = false
        var nextOp: String?
        for any in finalCommands {
            if let num = any as? Double {
                if !hasStarted {
                    hasStarted = true
                    sum = num
                } else if (nextOp == plus) {
                    sum = sum + num
                } else if (nextOp == multiply) {
                    sum = sum * num
                } else if (nextOp == subtract) {
                    sum = sum - num
                } else if (nextOp == divide) {
                    sum = sum / num
                }
            } else if let op = any as? String {
                nextOp = op
            }
        }
        
        shouldClear = true
        commands.removeAll()
        
        // Round to 5 decimal places
        sum = round(100000*sum)/100000
        
        // remove any tailing '.0'
        var sumString = String(sum)
        if sumString.hasSuffix(".0") {
            sumString = String(Int(sum))
        }
        
        inputLabel.text = sumString
    }
    
    
    func buttonDelPressed() {
        if (commands.count > 0) {
            commands.removeLast()
            
            if let name = inputLabel.text {
                inputLabel.text = name.substring(to: name.index(before: name.endIndex))
            }
        } else {
            inputLabel.text = " "
        }
    }

}

protocol SomeProtocol {
    var width: Int { get set }
    var initialWidth: Int { get }
}

