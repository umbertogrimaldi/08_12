//
//  books.swift
//  08_12
//
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import Foundation
import UIKit

class Book {
    
    var image: String
    var title: String
    var text: String
    var author: String
    var category: String
    
    init(image: String, title: String, text: String, author: String, category: String){
        self.image = image
        self.title = title
        self.text = text
        self.author = author
        self.category = category
    }
    
   
    
    class func createBooksArray() -> [Book]  {
        
        var books: [Book] = []
        
        let book1 = Book(image: "mikey.jpg", title: "MikeyMouse and stories and bla bla bla vla bla without comments", text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiudaLorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiudaLorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiudaLorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiudaLorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiudaLorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", author: "Autore One", category: "CCategoria Tre")
        
        let book2 = Book(image: "mutti.jpg", title: "MuttiSauce", text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", author: "Autore Due", category: "Categoria Uno")
        
          let book3 = Book(image: "apple.jpg", title: "Apple Developer Academy iOS", text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", author: "Autore Three", category: "Categoria Due")
        
        let book4 = Book(image: "the cat and the mouse", title: "The cat and the mouse", text: "The cat and the mouse\r\rPlay’d in the malt-house:\r\rThe cat bit the mouse’s tail off. “Pray, puss, give me my tail.” “No,” says the cat, “I’ll not give you your tail, till you go to the cow, and fetch me some milk.”\r\rFirst she leapt and then she ran,\r\r“Pray, Cow, give me milk, that I may give cat milk, that cat may give me my own tail again.” “No,” said the cow, “I will give you no milk, till you go to the farmer, and get me some hay.”\r\rFirst she leapt, and then she ran,\rTill she came to the farmer and thus began:\r“Pray, Farmer, give me hay, that I may give cow hay, that cow may give me milk, that I may give cat milk, that cat may give me my own tail again.” “No,” says the farmer, “I’ll give you no hay, till you go to the butcher and fetch me some meat.”\r\rFirst she leapt, and then she ran,\rTill she came to the butcher, and thus began:\r\r“Pray, Butcher, give me meat, that I may give farmer meat, that farmer may give me hay, that I may give cow hay, that cow may give me milk, that I may give cat milk, that cat may give me my own tail again.” “No,” says the butcher, “I’ll give you no meat, till you go to the baker and fetch me some bread.”First she leapt and then she ran,\rTill she came to the baker, and thus began:\r\r“Pray, Baker, give me bread, that I may give butcher bread, that butcher may give me meat, that I may give farmer meat, that farmer may give me hay, that I may give cow hay, that cow may give me milk, that I may give cat milk, that cat may give me my own tail again.”\r\r“Yes,” says the baker, “I’ll give you some bread,\rBut if you eat my meal, I’ll cut off your head.”\r\rThen the baker gave mouse bread, and mouse gave butcher bread, and butcher gave mouse meat, and mouse gave farmer meat, and farmer gave mouse hay, and mouse gave cow hay, and cow gave mouse milk, and mouse gave cat milk, and cat gave mouse her own tail again!", author: "Joseph Jacobs", category: "Children's book")
        
        
        
        
        books.append(book1)
        books.append(book2)
        books.append(book3)
        books.append(book4)
        
        return books
    }
}



