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
        ["Estrogen is primarily responsible for the development of female secondary sexual characteristics.", "True"],
        ["Hormonal birth control methods eliminate all hormonal fluctuations in women.", "False"],
        ["Testosterone is present in women and plays important roles, including influencing libido and bone density.", "True"],
        ["Menopause marks the end of a woman's reproductive years and is characterized by a significant drop in estrogen levels.", "True"]
    ]
    
    var qNum = 0
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle // "True" or "False"
        let answer = quiz[qNum][1] // Access current correct answer
        
        if userAnswer == answer {
            print("Right")
        } else {
            print("Wrong")
        }
        
        if qNum + 1 < quiz.count {
            qNum += 1
        } else {
            qNum = 0
        }
        
        updateUI()
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        
        questionLabel.text = quiz[qNum][0]
        
        
    }


}

