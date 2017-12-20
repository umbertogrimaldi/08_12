


//
//  ViewControllerReadGeneratedStory.swift
//  08_12
//
//  Created by Bruno Riccardi on 10/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

var favouritesBooks = UserDefaults.standard

//the UserDefaults.standard takes only string so this function translate an array of books into an array of string
func createArray(books: [Book]) -> [[String]] {
    var finalArray: [[String]] = []
    for elem in books {
        var bookArray: [String] = []
        bookArray.append(elem.title)
        bookArray.append(elem.text)
        bookArray.append(elem.image)
        bookArray.append(elem.author)
        bookArray.append(elem.category)
        finalArray.append(bookArray)
    }
    return finalArray
}



class ViewControllerReadGeneratedStory: UIViewController {
    
    
    //  change the color of the star button when is selected and the andd the book into the favouritesBooks array
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBAction func changeBackground(_ sender: Any) {
        
        
        
        
        //        imageDownload(bookId: 25 /* for test only, will be "bookId" from the API */)
        
        if isSelected {
            
            isSelected = false
            
            favButton.setImage(#imageLiteral(resourceName: "star_notselected"), for: .normal)
            
            var indexToRemove: Int?
            
            for x in 1...booksArray.shared.books.count {
                if booksArray.shared.books[x - 1].title == book?.title {
                    indexToRemove = x - 1
                }
            }
            booksArray.shared.books.remove(at: indexToRemove!)
            favouritesBooks.removeObject(forKey: "myArray")
            let myArray = createArray(books: booksArray.shared.books)
            favouritesBooks.set(myArray, forKey: "myArray")
            
        } else {
            //buttonState.backgroundColor = .red
            isSelected = true
            
            favButton.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            
            
            if let bookes = favouritesBooks.array(forKey: "myArray") as? [[String]]
            {
                let books = generatesBooksArray(books: bookes)
                booksArray.shared.books = books
            }
            if booksArray.shared.books.contains(where: { $0.title == book!.title })
            {
                //do nothing
            } else {
                booksArray.shared.books.insert(book!, at: 0)
                favouritesBooks.removeObject(forKey: "myArray")
                let myArray = createArray(books: booksArray.shared.books)
                favouritesBooks.set(myArray, forKey: "myArray")
            }
        }
        
    }
    
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookText: UITextView!
    
    //    umc
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    //    end
    
//    func textHeight() {
//        let fixedWidth = bookText.frame.size.width
//
//        bookText.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//
//        var newFrame = bookText.frame
//        let newSize = bookText.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//
//        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
//
//        bookText.frame = newFrame
//
//        let heightOfItems = newSize.height + bookTitle.frame.height + bookAuthor.frame.height
//
//        if heightOfItems <= scrollView.frame.height {
//            scrollViewHeight.constant = scrollView.frame.height
//        } else {
//            scrollViewHeight.constant = heightOfItems
//            // fine ScrollView height
//        }
//    }
//
    var book: Book?
    var isSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookText.text = book?.text
        bookText.isHidden = false
        bookAuthor.text = book?.author
        bookTitle.text = book?.title
        
//        activityIndicator.startAnimating()
//        activityIndicator.center = self.view.center
//        activityIndicator.color = UIColor(red:0.59, green:0.41, blue:0.82, alpha:1.0)
        
//        self.view.addSubview(activityIndicator)
        
        favButton.setImage(#imageLiteral(resourceName: "star_notselected"), for: .normal)
        
        tabBarController?.tabBar.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

