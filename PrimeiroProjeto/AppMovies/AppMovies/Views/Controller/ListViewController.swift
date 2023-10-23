//
//  ViewController.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var upcomingResult: UpcomingResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getUpcoming()
    }
    
    func getUpcoming() {
        UpcomingService().getUpcoming { [self] response in
            upcomingResult = response
            tableView.reloadData()
        }
    }


}

extension ListViewController: UITableViewDelegate {
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = upcomingResult?.results {
            return movies.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        if let movies = upcomingResult?.results {
            cell.label.text = movies[indexPath.row].title
        }
        return cell
    }
    
}
