//
//  JokesViewController.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {
    
    @IBOutlet weak var jokeTableView: UITableView!
    
    var jokes = [ProgrammingJokes]()    {
        didSet  {
            jokeTableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        jokeTableView.dataSource = self
    }
    
    func loadData() {
        jokes = ProgrammingJokes.getJokes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let jokeDetailedViewController = segue.destination as? JokeDetailedViewController, let indexPath = jokeTableView.indexPathForSelectedRow
            else    {
                fatalError()
        }
        
        let joke = jokes[indexPath.row] //from here to there
        jokeDetailedViewController.jokes = joke
    }
    
}

extension JokesViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jokeCell = jokeTableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        
        let joke = jokes[indexPath.row]
        
        //use joke instance to configure jokeCell
        jokeCell.textLabel?.text = joke.setup
        
        return jokeCell
        
    }
}
