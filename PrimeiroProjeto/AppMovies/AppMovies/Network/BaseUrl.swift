//
//  BaseUrl.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation

public struct BaseURL {
    
    static let shared = BaseURL()
    
    public var url: URLComponents
    
    private init() {
        url = URLComponents()
        url.scheme = "https"
        url.host = "api.themoviedb.org/3"
    }
}
