//
//  MovieDetailPageView.swift
//  TVOS+SwiftUI+Combine
//
//  Created by KOVIGROUP on 08/03/2023.
//

import SwiftUI

struct MovieDetailPageView: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RemoteImage(url: movie.posterPath!)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .clipped()

            Text(movie.title)
                .font(.title)
                .foregroundColor(.primary)

            Text(movie.category)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(movie.year)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
        .navigationBarTitle(movie.title)
    }
}

