//
//  ServiceResult.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation

struct UpcomingResult: Decodable {
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
