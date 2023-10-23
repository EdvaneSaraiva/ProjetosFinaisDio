//
//  MovieService.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation

class MovieService {
    
    func getUpComing() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1")!
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjRkYWZkODZlNTc1OThjYmIyZWVhZWIzMTk0YThkZCIsInN1YiI6IjViZWYzNGI1MGUwYTI2MjY2MTAyMWE0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zu_kTHzMrnFlr7r_-uHCIaeWCiBeXfEyY7y5bKnV97E"
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"


        URLSession.shared.dataTask(with: request) { (data, response , error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8) ?? "Invalid JSON")
        }.resume()
    }
}
