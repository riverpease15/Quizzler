//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    var quizBrain = QuizBrain()
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // "True" or "False"
        let correct = quizBrain.checkAnswer(userAnswer)
        
        if correct {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion();
    
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        score.text = "Score: \(quizBrain.getScore())"
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }


}

