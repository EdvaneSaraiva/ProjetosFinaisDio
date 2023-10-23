//
//  MovieDataProvider.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation
import Combine

protocol MovieDataProviderProtocol {
    func fetchUpcoming(language: String, page: String) -> AnyPublisher<[MovieResultModel], Error>
}

class MovieDataProvider: MovieDataProviderProtocol {
    
    private let movieStore: MovieStore
    
    init(movieStore: MovieStore = MovieStore()) {
        self.movieStore = movieStore
    }
    
    func fetchUpcoming(language: String, page: String) -> AnyPublisher<[MovieResultModel], Error> {
        return Future { promise in
            self.movieStore.fetchUpcoming(language: language, page: page) { result, error in
                if let error {
                    return promise(.failure(error))
                }
                
                guard let movie = result?.result else {
                    return
                }
                
                print(movie)
                
//                let movieUpcoming = movie.map {
//                    MovieResultModel(id: $0, posterPath: $1, title: $2, overview: $3)
//                }
                
                //TODO - Corrigir
                let movieUpcoming = [MovieResultModel(id: 1, posterPath: "a", title: "b", overview: "c")]
                
                return promise(.success(movieUpcoming))
            }
        }.eraseToAnyPublisher()
    }
}
