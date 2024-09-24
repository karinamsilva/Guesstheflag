//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Karina on 19/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = FlagViewModel()
    let button = ButtonView()
    var answerAlert = UIAlertController()
    var finalAlert = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButtonTarget()
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
    
    func setupButtonTarget() {
        button.firstButton.addTarget(self, action: #selector(flagSelected), for: .touchUpInside)
        button.secondButton.addTarget(self, action: #selector(flagSelected), for: .touchUpInside)
        button.thirdButton.addTarget(self, action: #selector(flagSelected), for: .touchUpInside)
        
        askQuestion()
    }
    
    func setupButtonImage(){
        button.firstButton.setImage(UIImage(named: viewModel.countries[0]), for: .normal)
        button.secondButton.setImage(UIImage(named: viewModel.countries[1]), for: .normal)
        button.thirdButton.setImage(UIImage(named: viewModel.countries[2]), for: .normal)
    }
    
    @objc func flagSelected(_ sender: UIButton) {
        if sender.tag == viewModel.correctAnswer {
            viewModel.score += 1
            showAlert(with: "Correct", message: nil)
        } else {
            viewModel.score -= 1
            showAlert(with: "Wrong", message: "That's the flag of \(viewModel.countries[sender.tag].uppercased())")
        }
        
        viewModel.questionAnswered += 1
        if viewModel.questionAnswered >= 10 {
            answerAlert.dismiss(animated: true) {
                self.showFinalAlert()
            }
            
        }
    }
    
    func showFinalAlert() {
        finalAlert = UIAlertController(title: "End Game", message: viewModel.setFinalScore(), preferredStyle: .alert)
        finalAlert.addAction(UIAlertAction(title: "Finish", style: .destructive, handler: { action in
            self.finalAlert.dismiss(animated: true)
        }))
        finalAlert.addAction(UIAlertAction(title: "Restart", style: .cancel, handler: { action in
            self.viewModel.setEverythingToZero()
            self.askQuestion()
        }))
        self.present(finalAlert, animated: true)
        
    }
    
    func showAlert(with title:String, message: String?) {
        answerAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        answerAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        self.present(answerAlert, animated: true)
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        viewModel.setupQuestion()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score: \(viewModel.score)", style: .plain, target: nil, action: nil)
        setupButtonImage()
        title = viewModel.countries[viewModel.correctAnswer].uppercased()
    }
}
