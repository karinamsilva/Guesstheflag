//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Karina on 19/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    //create a viewmodel and send it there later
    var score = 0
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    var button = ButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        askQuestion()
    }
    
    func setupView() {
        view.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
  
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func askQuestion() {
        button.firstButton.setImage(UIImage(named: countries[0]), for: .normal)
        button.secondButton.setImage(UIImage(named: countries[1]), for: .normal)
        button.thirdButton.setImage(UIImage(named: countries[2]), for: .normal)
    }

}

