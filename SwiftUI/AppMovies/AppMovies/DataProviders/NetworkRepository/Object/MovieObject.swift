//
//  MovieObject.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation

struct MovieObject<Result: Codable>: Codable {
    var page: String?
    var result: Result?
    var total_pages: Int?
    var total_results: Int?
}

typealias ResultObject = [String: MovieResult]

struct MovieResult: Identifiable, Codable {
    
    let id: Int
    let posterPath: String
    let title: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case overview
    }
}

//typealias RatesHistoricalObject = [String: [String: Double]]
