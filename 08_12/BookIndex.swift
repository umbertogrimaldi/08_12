//
//  BookIndex.swift
//  08_12
//
//  Created by Bruno Riccardi on 18/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import Foundation

// 1. Make a struct of the JSON data you will take from the url. It must be the same as the JSON online. In this case there is only a value: "texts" that is an array of elements. Inside of this array there are all the "books" containing three informations: title, author and text_id.
struct BooksIndex : Decodable {
    let texts: [Texts]
}

struct Texts : Decodable {
    let author: [String]
    let title: [String]
    let id: Int
    //    2. In order to match Swift’s naming convention we will change the snake case object "text_id" in "id".
    private enum CodingKeys : String, CodingKey {
        case author
        case title
        case id = "text_id"
    }
}
