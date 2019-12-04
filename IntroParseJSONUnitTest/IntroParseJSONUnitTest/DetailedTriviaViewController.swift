//
//  DetailedTriviaViewController.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailedTriviaViewController: UIViewController {

    @IBOutlet weak var questionButton1: UIButton!
    @IBOutlet weak var questionButton2: UIButton!
    @IBOutlet weak var questionButton3: UIButton!
    @IBOutlet weak var questionButton4: UIButton!

    
    var trivias: Trivia?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updataUI()
    }
    
    func combineAnswers() -> [String] {
        var combinedAnswers = [String]()
        for element in trivias?.incorrectAnswers ?? [String]()    {
            combinedAnswers.append(element.removingPercentEncoding ?? "")
        }
        combinedAnswers.append(trivias?.correctAnswer.removingPercentEncoding ?? "")
        return combinedAnswers
    }
    
    func shuffleAnswers(for AnswersArray: [String]) -> [String]   {
        let shuffledAnswers = AnswersArray.shuffled()
        return shuffledAnswers
    }
    
    func updataUI() {
        let combinedAnswers = combineAnswers()
        var shuffledAnswers = shuffleAnswers(for: combinedAnswers)
        questionButton1.setTitle(shuffledAnswers.popLast(), for: .normal)
        questionButton2.setTitle(shuffledAnswers.popLast(), for: .normal)
        questionButton3.setTitle(shuffledAnswers.popLast(), for: .normal)
        questionButton4.setTitle(shuffledAnswers.popLast(), for: .normal)
    }
    
    
    
    @IBAction func questionButtonPressed(_ sender: UIButton) {
        switch sender.tag   {
        case 0:
            if questionButton1.titleLabel?.text == trivias?.correctAnswer   {
                view.backgroundColor = .green
            }
            else    {
                view.backgroundColor = .red
            }
        case 1:
        if questionButton2.titleLabel?.text == trivias?.correctAnswer   {
            view.backgroundColor = .green
        }
        else    {
            view.backgroundColor = .red
        }
        case 2:
        if questionButton3.titleLabel?.text == trivias?.correctAnswer   {
            view.backgroundColor = .green
        }
        else    {
            view.backgroundColor = .red
        }
            case 3:
            if questionButton4.titleLabel?.text == trivias?.correctAnswer   {
                view.backgroundColor = .green
            }
            else    {
                view.backgroundColor = .red
            }
        default:
            print("default")
        }
        questionButton1.isEnabled = false
        questionButton2.isEnabled = false
        questionButton3.isEnabled = false
        questionButton4.isEnabled = false

    }
    
    
}
