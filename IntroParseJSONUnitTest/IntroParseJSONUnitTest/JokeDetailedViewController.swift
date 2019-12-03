//
//  JokeDetailedViewController.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class JokeDetailedViewController: UIViewController {

    @IBOutlet weak var punchLineLabel: UILabel!
    
    var jokes: ProgrammingJokes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        punchLineLabel.text = jokes?.punchline
    }

}
