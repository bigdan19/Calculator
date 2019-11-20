//
//  ViewController.swift
//  Calculator
//
//  Created by Daniel on 12/11/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

enum modes {
    case notSet
    case addition
    case substraction
    case multiplication
    case divide
}

class ViewController: UIViewController {
    
    var labelString: String = "0"
    var currentMode: modes = .notSet
    var savedNum: Double = 0
    var lastButtonWasMode: Bool = false
    
    func updateText() {
        guard let labelInt: Double = Double(labelString) else {
            Label.text = "Error"
            return
        }
        if currentMode == .notSet {
            savedNum = labelInt
        }
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num: NSNumber = NSNumber(value: labelInt)
        
        Label.text = formatter.string(from: num)
    }
    
    func changeModes(newMode: modes) {
        if savedNum == 0 {
            return
        }
        
        currentMode = newMode
        lastButtonWasMode = true
    }
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func didPressPlus(_ sender: Any) {
        changeModes(newMode: .addition)
    }
    
    @IBAction func didPressMinus(_ sender: Any) {
        changeModes(newMode: .substraction)
    }
    
    @IBAction func didPressMultiply(_ sender: Any) {
        changeModes(newMode: .multiplication)
    }
    @IBAction func didPressEquals(_ sender: Any) {
        guard let labelInt: Int = Int(labelString) else {
                   Label.text = "Error"
                   return
               }
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        
        if currentMode == .addition {
            savedNum = Double(savedNum + Double(labelInt))
        } else if currentMode == .substraction {
            savedNum = Double(savedNum - Double(labelInt))
        } else if currentMode == .multiplication {
            savedNum = Double(savedNum * Double(labelInt))
        } else if currentMode == .divide {
            savedNum = Double((savedNum / Double(labelInt)) * 100.rounded() / 100)
        }
        
        currentMode = .notSet
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    
    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        currentMode = .notSet
        savedNum = 0
        lastButtonWasMode = false
        Label.text = "0"
    }
    
    @IBAction func didPressButton(_ sender: UIButton) {
        guard let stringValue: String = sender.titleLabel?.text else {
            Label.text = "Error"
            return
        }
        
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        
        labelString = labelString.appending(stringValue)
        updateText()
    }
    
    @IBAction func didPressDivide(_ sender: Any) {
        changeModes(newMode: .divide)
    }
    
    @IBAction func didPressPlusOrMinus(_ sender: Any) {
        guard let stringValue: String = Label.text else {
        Label.text = "Error"
        return
        }
        guard let intNumber = Int(stringValue) else { return }
            if intNumber > 0 {
                Label.text = "\(-intNumber)"
                labelString = "\(-intNumber)"
                updateText()
            } else if intNumber < 0 {
                Label.text = "\(abs(intNumber))"
                labelString = "\(abs(intNumber))"
                updateText()
        }
    }
}

