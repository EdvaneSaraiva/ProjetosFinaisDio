//
//  ContentView.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 21/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var movies: [Movie] = [
        Movie(name: "Homem Aranha", image: "https://www.kasandbox.org/programming-images/avatars/purple-pi.png"),
        Movie(name: "Homem de ferro", image: "https://www.kasandbox.org/programming-images/avatars/primosaur-ultimate.png"),
        Movie(name: "Vingadores", image: "https://www.kasandbox.org/programming-images/avatars/mr-pants.png")
    ]

    var body: some View {
        NavigationView {
            VStack {
                moviesFluctuationListView
            }
            .onAppear() {
                MovieService().getUpComing()
            }
        }
    }
    
    private var moviesFluctuationListView: some View {
        List(movies) { movie in
            NavigationLink(destination: DetailView(movie: movie)) {
                HStack {
                    Text("\(movie.name)")
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
