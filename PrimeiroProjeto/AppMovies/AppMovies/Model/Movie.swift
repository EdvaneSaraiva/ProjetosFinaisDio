//
//  Movie.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation

struct Movie: Decodable {
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
