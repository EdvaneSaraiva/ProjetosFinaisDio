//
//  UpcomingRouter.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation

enum MovieRouter {
    
    case upcoming(language: String, page: String)
    
    var path: String {
        switch self {
        case .upcoming: return MoviesApi.upcoming
        }
    }
    
    func asUrlRequest() -> URLRequest? {
        guard var url = URL(string: MoviesApi.baseUrl) else { return nil }
        
        switch self {
        case .upcoming(let language, let page):
            url.append(queryItems: [
                URLQueryItem(name: "language", value: language),
                URLQueryItem(name: "page", value: page)
            ])
        }
        
        var request = URLRequest(url: url.appendingPathComponent(path), timeoutInterval: Double.infinity)
        request.httpMethod = HttpMethod.get.rawValue
        request.addValue("Bearer \(MoviesApi.accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
}
