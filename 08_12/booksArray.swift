
//
//  booksArray.swift
//  08_12
//
//  Created by Bruno Riccardi on 11/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import Foundation
import UIKit

//singleton of books array

class booksArray {
    
    static let shared = booksArray()
    
    var books: [Book] = []
    
    
}
