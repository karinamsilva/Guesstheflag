//
//  ButtonView.swift
//  GuessTheFlag
//
//  Created by Karina on 19/09/24.
//

import UIKit

class ButtonView: UIView {
    
    let firstButton = setupButton()
    let secondButton = setupButton()
    let thirdButton = setupButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addToView()
        setConstraints()
        setupButtonTag()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func setupButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive =  true
        return button
    }
    
    func setupButtonTag() {
        firstButton.tag = 0
        secondButton.tag = 1
        thirdButton.tag = 2
    }
    
    func addToView() {
        addSubview(firstButton)
        addSubview(secondButton)
        addSubview(thirdButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 30),
            firstButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 30),
            secondButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 30),
            thirdButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor),
        ])
    }
}
