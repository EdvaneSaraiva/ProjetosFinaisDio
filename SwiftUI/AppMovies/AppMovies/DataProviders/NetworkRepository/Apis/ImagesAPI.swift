//
//  ImagesAPI.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 25/10/23.
//

import Foundation

struct ImagesAPI {
    let imageBaseURL = "https://image.tmdb.org/t/p/"
}

enum PosterSizes: String {
    case w92
    case w154
    case w185
    case w342
    case w500
    case w780
    case original
}
