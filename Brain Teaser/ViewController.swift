//
//  ViewController.swift
//  Brain Teaser
//
//  Created by George Aoyagi on 12/10/19.
//  Copyright © 2019 George Aoyagi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    let textColor = ["Red", "Blue", "Green", "Yellow", "Purple", "Orange"]
    let colors = ["Red":UIColor.red, "Blue":UIColor.blue, "Green":UIColor.green, "Yellow":UIColor.yellow, "Purple":UIColor.purple, "Orange":UIColor.orange]
    var score = 0
    var matching:Bool = true
    
    
    
    @IBOutlet weak var firstWord: UILabel!
    @IBOutlet weak var secondWord: UILabel!
    
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var scoreNum: UILabel!
    
    @IBOutlet weak var trueText: UIButton!
    @IBOutlet weak var falseText: UIButton!
    @IBOutlet weak var startText: UIButton!
    @IBOutlet weak var overText: UILabel!
    
    @IBOutlet weak var timeText: UILabel!
    @IBOutlet weak var secText: UILabel!
    
    
    @IBOutlet weak var timeNum: UILabel!
    var timer:Timer?
    var timeLeft = 60
    
    @objc func onTimerFires()
    {
        timeLeft -= 1
        timeNum.text = "\(timeLeft)"
        if timeLeft <= 0 {
            timer!.invalidate()
            timer = nil
            gameOver()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreText.isHidden = true
        scoreNum.isHidden = true
        trueText.isHidden = true
        falseText.isHidden = true
        overText.isHidden = true
        timeNum.isHidden = true
        timeText.isHidden = true
        secText.isHidden = true
    }
    
    @IBAction func startButton(_ sender: Any) {
        randomizer()
        scoreText.isHidden = false
        scoreNum.isHidden = false
        trueText.isHidden = false
        falseText.isHidden = false
        firstWord.isHidden = false
        secondWord.isHidden = false
        timeNum.isHidden = false
        timeText.isHidden = false
        secText.isHidden = false
        startText.isHidden = true
        overText.isHidden = true
        
        self.score = 0
        scoreNum.text = "0"

        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func checkTrue(_ sender: Any) {
        if matching{
            self.score+=1
            scoreNum.text = String(self.score)
            randomizer()
        } else {
            self.score -= 1
            scoreNum.text = String(self.score)
            randomizer()
        }
    }
    
    @IBAction func checkFalse(_ sender: Any) {
        if !matching {
            self.score += 1
            scoreNum.text = String(self.score)
            randomizer()
        } else {
            self.score -= 1
            scoreNum.text = String(self.score)
            randomizer()
        }
    }
    
    func randomizer(){
        let textWord = self.textColor.randomElement()
        let matchColor = self.textColor.randomElement()
        let matchText = self.textColor.randomElement()
        
        if textWord == matchColor{
            self.matching = true
        } else {
            self.matching = false
        }

        firstWord.text = textWord
        secondWord.textColor = self.colors[matchColor!]
        secondWord.text = matchText
    }
    
    func gameOver(){
        trueText.isHidden = true
        falseText.isHidden = true
        firstWord.isHidden = true
        secondWord.isHidden = true
        startText.isHidden = false
        overText.isHidden = false
        timeNum.isHidden = true
        timeText.isHidden = true
        secText.isHidden = true
        self.timeLeft = 60
    }
    
   
}




