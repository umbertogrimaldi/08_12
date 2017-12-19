//
//  File.swift
//  08_12
//
//  Created by Umberto on 18/12/17.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import Foundation
import UIKit

var bookImage: UIImage?

func imageDownload(bookId: Int) {
    let bookCoverUrl = URL(string: "http://www.gutenberg.org/cache/epub/\(bookId)/pg\(bookId).cover.medium.jpg")!
    let session = URLSession(configuration: .default)
    
    session.dataTask(with: bookCoverUrl) { (data, response, error) in
        // The download has finished.
        if (response as! HTTPURLResponse).statusCode == 404 {
            let image = #imageLiteral(resourceName: "mutti")
            bookImage = image
        } else {
            // No errors found.
            // It would be weird if we didn't have a response, so check for that too.
            if let res = response as? HTTPURLResponse {
                print("Downloaded cat picture with response code \(res.statusCode)")
                if let imageData = data {
                    // Finally convert that Data into an image and do what you wish with it.
                    let image = UIImage(data: imageData)
                    bookImage = image
                    // Do something with your image.
                } else {
                    print("Couldn't get image: Image is nil")
                }
            } else {
                print("Couldn't get response code for some reason")
            }
        }
        }.resume()
}
