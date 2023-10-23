//
//  DetailView.swift
//  AppMovies
//
//  Created by Edvane Batista Saraiva Bruno on 21/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @State var movie: Movie
    
    var body: some View {
        if let image = movie.image {
            WebImage(url: URL(string: image))
        }
        Text(movie.name)
    }
}

#Preview {
    DetailView(movie: Movie(name: "Teste", image: "https://www.kasandbox.org/programming-images/avatars/mr-pants.png"))
}
