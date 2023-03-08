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
            HStack(alignment: .top, spacing: 120) {
                ForEach(viewModel.movies) { movie in
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 10) { // new VStack
                            Button(action: {}) {
                                RemoteImage(url: movie.posterPath!)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 450, height: 600)
                                    .cornerRadius(10)
                            }
                            .buttonStyle(PlainButtonStyle())
                            Text(movie.title)
                                .font(.subheadline) // or .caption
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
                    .padding(.leading, 140)
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

