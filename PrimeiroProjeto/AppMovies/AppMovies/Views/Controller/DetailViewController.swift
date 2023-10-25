//
//  DetailViewController.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 25/10/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        if let movie = movie {
            imageView.downloaded(from: ImagesAPI().imageBaseURL + PosterSizes.w342.rawValue + movie.posterPath)
            movieTitle.text = movie.title
            movieDescription.text = movie.overview
        }
    }

}
