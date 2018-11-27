//
//  ViewController.swift
//  homework006
//
//  Created by FISH on 2018/11/23.
//  Copyright © 2018年 FISH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gradientBg: UIView!
    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var dora1: UIImageView!
    @IBOutlet weak var dora2: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var borderWidthSlider: UISlider!
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    @IBOutlet weak var redSliderSwitch: UISwitch!
    @IBOutlet weak var greenSliderSwitch: UISwitch!
    @IBOutlet weak var blueSliderSwitch: UISwitch!
    @IBOutlet weak var alphaSliderSwitch: UISwitch!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var alphaValue: UILabel!
    @IBOutlet weak var borderWidthValue: UILabel!
    @IBOutlet weak var cornerRadiusValue: UILabel!
    @IBOutlet weak var gradientSwitch: UISwitch!
    @IBOutlet weak var gradientSlider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeBgColor(_ sender: UISlider) {
        redSlider.value.round()
        greenSlider.value.round()
        blueSlider.value.round()
        let bgColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        bg.backgroundColor = bgColor
        
        redValue.text = Int(redSlider.value).description
        greenValue.text = Int(greenSlider.value).description
        blueValue.text = Int(blueSlider.value).description
        
        if let gradientLayer = gradientBg.layer.sublayers?[0] as? CAGradientLayer {
            gradientLayer.colors = [UIColor.black.cgColor, bgColor.cgColor, UIColor.black.cgColor]
        }
    }

    @IBAction func changeDora2Alpha(_ sender: UISlider) {
        sender.value.round()
        dora2.alpha = CGFloat(sender.value / 10)
        alphaValue.text = String(sender.value / 10)
    }
    
    @IBAction func changeBorderWidth(_ sender: UISlider) {
        sender.value.round()
        dora1.layer.borderWidth = CGFloat(sender.value)
        borderWidthValue.text = Int(sender.value).description
    }
    
    @IBAction func changeBorderRadius(_ sender: UISlider) {
        sender.value.round()
        dora1.layer.cornerRadius = CGFloat(sender.value)
        dora2.layer.cornerRadius = CGFloat(sender.value)
        bg.layer.cornerRadius = CGFloat(sender.value)
        if let gradientLayer = gradientBg.layer.sublayers?[0] as? CAGradientLayer {
            gradientLayer.cornerRadius = CGFloat(sender.value)
        }
        
        cornerRadiusValue.text = Int(sender.value).description
    }
    
    @IBAction func switchRedSlider(_ sender: Any) {
        redSlider.isEnabled = redSliderSwitch.isOn
    }
    
    @IBAction func switchGreenSlider(_ sender: Any) {
        greenSlider.isEnabled = greenSliderSwitch.isOn
    }
    
    @IBAction func switchBlueSlider(_ sender: Any) {
        blueSlider.isEnabled = blueSliderSwitch.isOn
    }
    
    @IBAction func switchAlphaSlider(_ sender: Any) {
        alphaSlider.isEnabled = alphaSliderSwitch.isOn
    }
    
    @IBAction func radomChange(_ sender: Any) {
        let redNumber = Float.random(in: 0...255).rounded()
        let greenNumber = Float.random(in: 0...255).rounded()
        let blueNumber = Float.random(in: 0...255).rounded()
        let alphaNumber = Float.random(in: 0...10).rounded()
        
        if redSliderSwitch.isOn {
            redSlider.value = redNumber
        }
        if greenSliderSwitch.isOn {
            greenSlider.value = greenNumber
        }
        if blueSliderSwitch.isOn {
            blueSlider.value = blueNumber
        }
        let bgColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        
        bg.backgroundColor = bgColor
        if let gradientLayer = gradientBg.layer.sublayers?[0] as? CAGradientLayer {
            gradientLayer.colors = [UIColor.black.cgColor, bgColor.cgColor, UIColor.black.cgColor]
        }
        
        if alphaSliderSwitch.isOn {
            alphaSlider.value = alphaNumber
        }
        dora2.alpha = CGFloat(alphaSlider.value / 10)
        
        redValue.text = Int(redSlider.value).description
        greenValue.text = Int(greenSlider.value).description
        blueValue.text = Int(blueSlider.value).description
        alphaValue.text = String(alphaSlider.value / 10)
    }
    
    @IBAction func showGradient(_ sender: Any) {
        bg.layer.isHidden = gradientSwitch.isOn
        gradientBg.layer.isHidden = !gradientSwitch.isOn
        gradientSlider.isEnabled = gradientSwitch.isOn
        
        if gradientSwitch.isOn, gradientBg.layer.sublayers == nil {
            let bgColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = gradientBg.bounds
            gradientLayer.colors = [UIColor.black.cgColor, bgColor.cgColor, UIColor.black.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            gradientLayer.cornerRadius = CGFloat(cornerRadiusSlider.value)
            gradientLayer.locations = [0, 0.5, 1]
            gradientBg.layer.addSublayer(gradientLayer)
        }
    }
    
    @IBAction func changeGradientLocation(_ sender: UISlider) {
        if let gradientLayer = gradientBg.layer.sublayers?[0] as? CAGradientLayer {
            gradientLayer.locations = [0, NSNumber(value: sender.value), 1]
        }
    }
    
}

