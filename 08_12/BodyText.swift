//
//  BodyText.swift
//  08_12
//
//  Created by Bruno Riccardi on 18/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import Foundation

struct BodyText: Decodable {
    let body: String
    let id: Int
    
    private enum CodingKeys : String, CodingKey {
        case body
        case id = "text_id"
    }
}
