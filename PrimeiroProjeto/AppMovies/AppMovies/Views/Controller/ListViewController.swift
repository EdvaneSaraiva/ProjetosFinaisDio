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
    var movies: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        getUpcoming()
    }
    
    func getUpcoming() {
        UpcomingService().getUpcoming { [self] response in
            upcomingResult = response
            if let movies = response?.results {
                self.movies = movies
            }
            tableView.reloadData()
        }
    }

}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        if let movies = movies {
            detailViewController.movie = movies[indexPath.row]
        }
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        if let movies = movies {
            cell.label.text = movies[indexPath.row].title
        }
        return cell
    }
    
}
