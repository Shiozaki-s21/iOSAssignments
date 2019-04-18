//
//  ViewController.swift
//  Assignment1
//
//  Created by SubaruShiozaki on 2019-04-17.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupLayout()
    }
    
    let blueSquare:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        
        return v
    }()
    
    
    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        let buttStackView = UIStackView(arrangedSubviews: [
            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        
        // create stackView for main
        let mainStackView:UIStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 8
        mainView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        mainStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        
        
        // red stackView
        let redStackView:UIStackView = UIStackView()
        redStackView.axis = .horizontal
        redStackView.alignment = .center
        redStackView.distribution = .equalCentering
        redStackView.spacing = 8
        redStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(redStackView)
        redStackView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.9).isActive = true
        redStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive  = true
        redStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true

        // red Square
        let redSquare:UIView = UIView()
        redStackView.addArrangedSubview(redSquare)
        redSquare.backgroundColor = .red
        redSquare.translatesAutoresizingMaskIntoConstraints = false
        redSquare.heightAnchor.constraint(equalTo: redStackView.heightAnchor, multiplier: 0.6).isActive = true
        redSquare.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        // orange stack view
        let orangeStackView:UIStackView = UIStackView()
        orangeStackView.axis = .horizontal
        orangeStackView.alignment = .center
        orangeStackView.distribution = .equalCentering
//        orangeStackView.spacing = 30
        orangeStackView.translatesAutoresizingMaskIntoConstraints = false
        redSquare.addSubview(orangeStackView)
        orangeStackView.heightAnchor.constraint(equalTo: redSquare.heightAnchor).isActive = true
        orangeStackView.widthAnchor.constraint(equalTo: redSquare.widthAnchor, multiplier: 0.8).isActive = true
        orangeStackView.centerXAnchor.constraint(equalTo: redSquare.centerXAnchor).isActive = true
        orangeStackView.centerYAnchor.constraint(equalTo: redSquare.centerYAnchor).isActive = true
    
        // orange square
        let orangeSquareLeft:UIView = UIView()
        let orangeSquareRight:UIView = UIView()
        
        orangeStackView.addArrangedSubview(orangeSquareLeft)
        orangeStackView.addArrangedSubview(orangeSquareRight)
        
        orangeSquareRight.backgroundColor = .orange
        orangeSquareLeft.backgroundColor = .orange
        
        orangeSquareLeft.translatesAutoresizingMaskIntoConstraints = false
        orangeSquareRight.translatesAutoresizingMaskIntoConstraints = false
        orangeSquareLeft.heightAnchor.constraint(equalTo: orangeStackView.heightAnchor, multiplier: 0.6).isActive = true
        orangeSquareRight.heightAnchor.constraint(equalTo: orangeStackView.heightAnchor, multiplier: 0.6).isActive = true
        orangeSquareLeft.widthAnchor.constraint(equalTo: orangeStackView.widthAnchor, multiplier: 0.5).isActive = true
        orangeSquareRight.widthAnchor.constraint(equalTo: orangeStackView.widthAnchor, multiplier: 0.4).isActive = true
        
        
        // bunch of blue square
        let blueSquare1:UIView = UIView()
        let blueSquare2:UIView = UIView()
        let blueSquare3:UIView = UIView()
        let bunchOfBlue = UIStackView(frame: .zero)

        bunchOfBlue.axis = .vertical
        bunchOfBlue.alignment = .center
        bunchOfBlue.distribution = .equalSpacing
        bunchOfBlue.spacing = 8
        bunchOfBlue.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(bunchOfBlue)
        bunchOfBlue.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        bunchOfBlue.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        bunchOfBlue.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7).isActive = true
        bunchOfBlue.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true

        bunchOfBlue.addArrangedSubview(blueSquare1)
        bunchOfBlue.addArrangedSubview(blueSquare2)
        bunchOfBlue.addArrangedSubview(blueSquare3)

        blueSquare1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        blueSquare1.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        blueSquare1.backgroundColor = .blue
        blueSquare1.translatesAutoresizingMaskIntoConstraints = false

        blueSquare2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        blueSquare2.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        blueSquare2.backgroundColor = .blue
        blueSquare2.translatesAutoresizingMaskIntoConstraints = false

        blueSquare3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        blueSquare3.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        blueSquare3.backgroundColor = .blue
        blueSquare3.translatesAutoresizingMaskIntoConstraints = false
        
        // purple StackView
        let purpleStckView:UIStackView = UIStackView()
        purpleStckView.alignment = .center
        purpleStckView.axis = .horizontal
        purpleStckView.distribution = .equalCentering
        purpleStckView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(purpleStckView)
        purpleStckView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        purpleStckView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.9).isActive = true
        //        purpleStckView.centerYAnchor.constraint(equalTo: mainStackView).isActive = true
        
        // purple Square
        let purpleSquare:UIView = UIView()
        purpleSquare.backgroundColor = .purple
        purpleSquare.translatesAutoresizingMaskIntoConstraints = false
        purpleStckView.addArrangedSubview(purpleSquare)
        purpleSquare.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6).isActive = true
        purpleSquare.heightAnchor.constraint(equalTo: redSquare.heightAnchor).isActive = true
        
        mainStackView.bringSubviewToFront(bunchOfBlue)
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

