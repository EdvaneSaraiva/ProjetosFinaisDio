//
//  DetailViewCodeViewController.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 25/10/23.
//

import UIKit
import TinyConstraints
import ConstraintsKit

class DetailViewCodeViewController: UIViewController {

    var movie: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
}

extension DetailViewCodeViewController {
    
    func configureView() {
        self.view.backgroundColor = .white
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 260, height: 260)
        
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if let movie = movie {
            titleLabel.text = movie.title
            descriptionLabel.text = movie.overview
            imageView.downloaded(from: ImagesAPI().imageBaseURL + PosterSizes.w342.rawValue + movie.posterPath)
        }
        
        //Stack View
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16.0

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        
        //Constrainst
        do  {
            try stackView
                .center(in: self.view, axis: .vertical)
                .center(in: self.view, axis: .horizontal)
                .left(with: self.view, anchor: .left,   offset:  16)
                .right(with: self.view, anchor: .right,  offset: -16)
        } catch {
            print("Constraints Error")
        }
    }
}
