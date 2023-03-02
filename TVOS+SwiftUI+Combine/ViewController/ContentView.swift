//
//  ContentView.swift
//  TVOS+SwiftUI+Combine
//
//  Created by KOVIGROUP on 02/03/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(alignment: .top, spacing: 280) {
                ForEach(viewModel.movies) { movie in
                    VStack(alignment: .leading, spacing: 10) {
                        RemoteImage(url: movie.posterPath!)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 450, height: 600)
                            .cornerRadius(10)
                        Text(movie.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(movie.category)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text(movie.year)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(width: 300)
                }
            }
        }
        .onAppear {
            viewModel.getMovies()
        }
        .onPlayPauseCommand {
            print("Play/pause button pressed")
        }
    }
}
