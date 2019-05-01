//
//  ViewController.swift
//  TipCalculator
//
//  Created by SubaruShiozaki on 2019-04-30.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // to get gestureEvent
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeybord))
    
    // Labels
    let priceLabel:UILabel = UILabel()
    let tipLabel:UILabel = UILabel()
    let totalLabel:UILabel = UILabel()
    let tipPercentLabel = UILabel()
    
    // text fields
    let priceText:UITextField = UITextField()
    let tipText:UITextField = UITextField()
    let totalText:UILabel = UILabel()
    
    // buttons
    let calButton:UIButton = UIButton.init()
    
    // slider
    let tipSlider:UISlider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create each stack
        // price
        priceLabel.text = "Price:"
        priceText.borderStyle = .bezel
        priceText.becomeFirstResponder()
        let priceStack:UIStackView = UIStackView(arrangedSubviews: [priceLabel,priceText])
        priceLabel.widthAnchor.constraint(equalTo: priceStack.widthAnchor, multiplier: 0.3)
        priceStack.axis = .horizontal
        
        // tip
        tipLabel.text = "Tip   :"
        tipText.borderStyle = .bezel
        let tipStack:UIStackView = UIStackView(arrangedSubviews: [tipLabel, tipText])
        tipText.widthAnchor.constraint(equalTo: tipStack.widthAnchor, multiplier: 0.7)
        tipStack.axis = .horizontal

        // total
        totalLabel.text = "Total:"
        let totalStack:UIStackView = UIStackView(arrangedSubviews: [totalLabel, totalText])
        totalStack.axis = .horizontal

        // temp
        let temp = UIStackView()
        temp.addArrangedSubview(UILabel())

        // Button
        calButton.setTitle("Calculate Tip", for: .normal)
        calButton.backgroundColor = .blue
        calButton.isHidden = true
        
        // slider
        tipSlider.maximumValue = 100
        tipSlider.minimumValue = 0
        tipSlider.addTarget(self, action: #selector(sliderChanged), for: .touchUpInside)
        tipSlider.value = 15.0
        tipSlider.translatesAutoresizingMaskIntoConstraints = false
        
        // tipPercentlabel
        tipPercentLabel.text = "15"
        
        // stack which is combined price, tip, total
        let inputPartStack:UIStackView = UIStackView(arrangedSubviews: [temp, priceStack, tipStack, totalStack, tipSlider, tipPercentLabel])
    
        inputPartStack.axis = .vertical
        tipSlider.widthAnchor.constraint(equalTo: inputPartStack.widthAnchor)
        
        // button part stack
        let buttonStack:UIStackView = UIStackView(arrangedSubviews: [calButton])
        buttonStack.axis = .vertical
        buttonStack.alignment = .center
        
        // whole stackView
        let wholeStack:UIStackView = UIStackView(arrangedSubviews: [inputPartStack, buttonStack])
        wholeStack.axis = .vertical
        wholeStack.alignment = .center
        view.addSubview(wholeStack)
        wholeStack.translatesAutoresizingMaskIntoConstraints = false
        wholeStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wholeStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        wholeStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        wholeStack.spacing = 20
        wholeStack.distribution = .equalSpacing
        
        calButton.widthAnchor.constraint(equalTo: inputPartStack.widthAnchor, multiplier: 0.3).isActive = true
        
        calButton.addTarget(self, action: #selector(calculateTip) , for: .touchUpInside)
        
    }
    
    @objc func calculateTip(sender:UIButton) {
        if priceText.text != "" && tipText.text != "" {
            let priceInt = Int(priceText.text!)!
            let tipInt = Int(tipText.text!)!
            let total = priceInt + (priceInt * tipInt / 100)
            totalText.text = String(total)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureObserver()
    }
    
    //Mark: - Notifaction for keybord
    func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                 name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                 name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification?) {
        guard let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        UIView.animate(withDuration: duration) {
            let transform = CGAffineTransform(translationX: 0, y: -(rect.size.height))
            self.view.transform = transform
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification?) {
        guard let duration = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? TimeInterval else { return }
        UIView.animate(withDuration: duration) {
            self.view.transform = CGAffineTransform.identity
        }
    }
    
    // After SliderChange, call it
    @objc func sliderChanged(_ sender: UISlider) {
        tipPercentLabel.text = String(Int(sender.value))
        tipText.text = String(Int(sender.value))
        calculateTip(sender: calButton)
    }
    
    // as user, tap screen and then disapeer keybord
    @objc func dismissKeybord(_ sender:UITapGestureRecognizer) {
        
    }
    
    // close keybord when user tap other area
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        calculateTip(sender: calButton)
    }
}

