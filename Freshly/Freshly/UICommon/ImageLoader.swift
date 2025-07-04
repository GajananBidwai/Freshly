//
//  ImageLoader.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil

    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let downloadImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = downloadImage
                }
            }
        }.resume()
    }
}
