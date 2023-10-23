//
//  MovieStore.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation

protocol MovieStoreProtocol: GenericStoreProtocol {
    func fetchUpcoming(language: String, page: String, completion: @escaping completion<MovieObject<ResultObject>?>)
}

class MovieStore: GenericStoreRequest, MovieStoreProtocol {
    
    func fetchUpcoming(language: String, page: String, completion: @escaping completion<MovieObject<ResultObject>?>) {
        guard let urlRequest = MovieRouter.upcoming(language: language, page: page).asUrlRequest() else {
            return completion(nil, error)
        }
        request(urlRequest: urlRequest, completion: completion)
    }
}
