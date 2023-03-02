//
//  RemoteImage.swift
//  TVOS+SwiftUI+Combine
//
//  Created by KOVIGROUP on 02/03/2023.
//

import SwiftUI
import Combine

struct RemoteImage: View {
    @ObservedObject private var imageLoader = ImageLoader()
    private let placeholderImage: Image
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.placeholderImage = placeholder
        self.imageLoader.loadImage(from: url)
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            placeholderImage
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: imageURL)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
}

