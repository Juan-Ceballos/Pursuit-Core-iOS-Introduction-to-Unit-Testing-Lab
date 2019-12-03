//
//  DetailedSWFilmViewController.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailedSWFilmViewController: UIViewController {

    @IBOutlet weak var openingCrawlView: UITextView!
    
    var swFilms: SWFilms?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let swFilm = swFilms
            else    {
                fatalError()
        }
        openingCrawlView.text = swFilm.openingCrawl
    }

}
