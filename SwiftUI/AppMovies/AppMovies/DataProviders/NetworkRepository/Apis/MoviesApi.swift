//
//  MoviesApi.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

struct MoviesApi {
    
    static let baseUrl = "https://api.themoviedb.org/3/movie"
    static let language = "en-US"
    static let page = "1"
    static let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjRkYWZkODZlNTc1OThjYmIyZWVhZWIzMTk0YThkZCIsInN1YiI6IjViZWYzNGI1MGUwYTI2MjY2MTAyMWE0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zu_kTHzMrnFlr7r_-uHCIaeWCiBeXfEyY7y5bKnV97E"
    static let upcoming = "upcoming"
    
}
