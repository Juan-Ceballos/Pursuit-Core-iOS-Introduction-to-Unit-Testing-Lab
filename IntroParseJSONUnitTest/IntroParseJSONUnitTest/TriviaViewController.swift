//
//  ViewController.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var triviaTableView: UITableView!
    
    var trivias = [Trivia]()    {
        didSet  {
            triviaTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        triviaTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        trivias = TriviaData.getTrivia()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedTriviaViewController = segue.destination as? DetailedTriviaViewController, let indexPath = triviaTableView.indexPathForSelectedRow
            else    {
                fatalError()
        }
        
        let trivia = trivias[indexPath.row]
        detailedTriviaViewController.trivias = trivia
    }

}

extension TriviaViewController: UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trivias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let triviaCell = triviaTableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        
        let trivia = trivias[indexPath.row]
        
        triviaCell.textLabel?.text = trivia.question.removingPercentEncoding
        
        return triviaCell
    }
}

