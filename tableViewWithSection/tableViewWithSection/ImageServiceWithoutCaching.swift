//
//  ImageServiceWithoutCache.swift
//
//  Created by Fahim Rahman on 31/1/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//  Downloading image from API

import UIKit

class ImageService {
    
    static func downloadImage(url: URL, completion: @escaping(_ image: UIImage?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, responseUrl, error in
            var downloadedImage: UIImage?
            
            if let data = data {
                downloadedImage = UIImage(data: data)
            }

            DispatchQueue.main.async {
                completion(downloadedImage)
            }
        }.resume()
    }
}


// Use like this ->

//let imageUrl = "\(responseModel.user_image!)"
//
//ImageService.downloadImage(url: URL(string: imageUrl)!) { image in
//
//    self.imageView.image = image
//}
