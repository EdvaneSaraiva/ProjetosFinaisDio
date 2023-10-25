//
//  UpcomingResult.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 25/10/23.
//

import Foundation

struct UpcomingResult: Codable {
    var page: Int?
    var results: [Movie]?
    var totalPages: Int?
    var totalResults: Int?
    
    enum CodingKeys : String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
