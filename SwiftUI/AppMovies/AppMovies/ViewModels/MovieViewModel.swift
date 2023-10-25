//
//  MovieViewModel.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation
import Combine

protocol MovieListViewModelInterface: ObservableObject {
    var movieList: [Movie] { get set }
    init(moviesFetcher: MoviesFetchable)
    func fetchMovieList()
}

class MovieListViewModel {
    @Published var movieList: [Movie]
    private let moviesFetcher: MoviesFetchable
    private var disposables = Set<AnyCancellable>()

    required init(moviesFetcher: MoviesFetchable) {
        self.moviesFetcher = moviesFetcher
        self.movieList = [Movie]()
    }
}

//MARK: - MoviesListViewModelInterface Extension

extension MovieListViewModel: MovieListViewModelInterface {
    func fetchMovieList() {
        moviesFetcher
            .fetchMoviesList()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                switch value {
                case .failure:
                    self?.movieList = []
                case .finished:
                    break
                }
            } receiveValue: { [weak self] moviesResponse in
                if let movies = moviesResponse.results {
                    self?.movieList = movies
                }
            }
            .store(in: &disposables)
    }
}
