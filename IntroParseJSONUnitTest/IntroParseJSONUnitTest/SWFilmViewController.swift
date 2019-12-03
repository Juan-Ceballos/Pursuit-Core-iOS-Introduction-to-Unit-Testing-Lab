//
//  SWFilmViewController.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class SWFilmViewController: UIViewController {

    @IBOutlet weak var swTableView: UITableView!
    
    var swFilms = [SWFilms]()   {
        didSet  {
            swTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        swFilms = SWFilmsData.getFilms()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedSWFilmViewController = segue.destination as? DetailedSWFilmViewController, let indexPath = swTableView.indexPathForSelectedRow
            else    {
                fatalError()
        }
        
        let swFilm = swFilms[indexPath.row]
        detailedSWFilmViewController.swFilms = swFilm
    }

}

extension SWFilmViewController: UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        swFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let swCell = swTableView.dequeueReusableCell(withIdentifier: "swCell", for: indexPath)
        
        let swFilm = swFilms[indexPath.row]
        
        swCell.textLabel?.text = swFilm.title
        
        return swCell
    }
}
