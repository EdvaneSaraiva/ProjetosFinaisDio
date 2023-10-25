//
//  AppMoviesApp.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 21/10/23.
//

import SwiftUI

@main
struct AppMoviesApp: App {
    let viewModel = MovieListViewModel(moviesFetcher: MoviesAPI())
    var body: some Scene {
        WindowGroup {
            MoviewView(viewModel: viewModel)
        }
    }
}
