//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by River Pease on 10/6/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation;

struct QuizBrain {
    
    let quiz = [
        Question(question: "Estrogen is primarily responsible for the development of female secondary sexual characteristics.", answer: "True"),
        Question(question: "Hormonal birth control methods eliminate all hormonal fluctuations in women.", answer: "False"),
        Question(question: "Testosterone is present in women and plays important roles, including influencing libido and bone density.", answer: "True"),
        Question(question: "Menopause marks the end of a woman's reproductive years and is characterized by a significant drop in estrogen levels.", answer: "True"),
        Question(question: "All women experience the same hormonal changes during their menstrual cycle.", answer: "False"),
        Question(question: "Women produce more estrogen than testosterone during their reproductive years.", answer: "True"),
        Question(question: "The luteal phase of the menstrual cycle lasts about 14 days.", answer: "True"),
        Question(question: "Hormone replacement therapy (HRT) is only prescribed for women who have undergone a hysterectomy.", answer: "False"),
        Question(question: "Women experience a significant increase in progesterone levels during the luteal phase.", answer: "True"),
        Question(question: "Women produce no hormones after menopause.", answer: "False"),
        Question(question: "The adrenal glands produce hormones that can influence women's menstrual cycles.", answer: "True")
    ]
    
    var qNum = 0
    var score = 0 // starting score
    
    mutating func checkAnswer(_ answer: String) -> Bool {
        if answer == quiz[qNum].answer {
            score += 1
            return true;
        } else {
            return false;
        }
    }
    
    func getQuestionText() -> String {
        return quiz[qNum].question
    }
    
    func getProgress() -> Float {
        return Float(qNum + 1) / Float(quiz.count)
    }
    
    // When you make a method that changes a property of the struct from within itself, must mark as mutating
    // If you make an immutable instance of the struct (use let instead of var), you can't call a mutating function on that object
    mutating func nextQuestion() {
        if qNum + 1 < quiz.count {
            qNum += 1
        } else {
            qNum = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
}
