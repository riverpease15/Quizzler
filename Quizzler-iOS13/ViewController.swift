//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
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
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle // "True" or "False"
        let answer = quiz[qNum].answer // Access current correct answer
        
        if userAnswer == answer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if qNum + 1 < quiz.count {
            qNum += 1
        } else {
            qNum = 0
        }
    
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func updateUI() {
        
        questionLabel.text = quiz[qNum].question
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear

        progressBar.progress = Float(qNum + 1) / Float(quiz.count)
        
    }


}

