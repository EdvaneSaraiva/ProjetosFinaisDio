//
//  MovieViewModel.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 22/10/23.
//

import Foundation
import SwiftUI
import Combine

extension MoviewView {
    @MainActor class ViewModel: ObservableObject {
        enum ViewState {
            case start
            case loading
            case success
            case failure
        }
        
        @Published var movie = [MovieResultModel]()
        @Published var currentState: ViewState = .start
        
        private let dataProvider: MovieDataProvider?
        private var cancelables = Set<AnyCancellable>()
        
        init(dataProvider: MovieDataProvider = MovieDataProvider()) {
            self.dataProvider = dataProvider
        }
        
        func doFetchMovieUpcoming() {
            currentState = .loading
            
            dataProvider?.fetchUpcoming(language: "en-US", page: "1")
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        self.currentState = .success
                    case .failure(_):
                        self.currentState = .failure
                    }
                }, receiveValue: { movieResult in
                    withAnimation{
                        self.movie = movieResult.sorted { $0.title < $1.title }
                    }
                }).store(in: &cancelables)
        }
    }
}
