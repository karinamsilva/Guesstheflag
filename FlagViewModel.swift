//
//  FlagViewModel.swift
//  GuessTheFlag
//
//  Created by Karina on 24/09/24.
//

import Foundation

class FlagViewModel {
    
    var score = 0
    var correctAnswer = 0
    var questionAnswered = 0
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    
    func setupQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func setFinalScore() -> String? {
        return "Your final score is \(score)"
    }
    
    func setEverythingToZero() {
        score = 0
        correctAnswer = 0
        questionAnswered = 0
    }
    
    
}
