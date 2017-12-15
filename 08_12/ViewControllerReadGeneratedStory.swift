//
//  ViewControllerReadGeneratedStory.swift
//  08_12
//
//  Created by Bruno Riccardi on 10/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

var favouritesBooks = UserDefaults.standard

func createArray(books: [Book]) -> [[String]] {
    var finalArray: [[String]] = []
    for elem in books {
        var bookArray: [String] = []
        bookArray.append(elem.title)
        bookArray.append(elem.text)
        bookArray.append(elem.image)
        finalArray.append(bookArray)
    }
    return finalArray
}

class ViewControllerReadGeneratedStory: UIViewController {


    
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func changeBackground(_ sender: Any) {
        
        if isSelected {
            
            isSelected = false
            favButton.setImage(#imageLiteral(resourceName: "star_notselected"), for: .normal)
           //favButton.titleEdgeInsets = UIEdgeInsetsMake(0, #imageLiteral(resourceName: "Star 2").width, 0, 0)
            
            //favButton.sizeToFit()
            
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
    
    
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var bookText: UITextView!
    var book: Book?
    var isSelected: Bool = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bookTitle.text = book?.title
        bookText.text = book?.text
        // Do any additional setup after loading the view.
        
        favButton.setImage(#imageLiteral(resourceName: "star_notselected"), for: .normal)
        
        tabBarController?.tabBar.isHidden = true
        
//        var botton = UIBarButtonItem(image: #imageLiteral(resourceName: "Star 2"), style: .plain, target: self, action: #selector(addTapped))
//
//        navigationItem.setRightBarButtonItems([botton], animated: true)
        
        //navigationItem.rightBarButtonItem?.tintColor = UIColor.darkGray
        
//        rightBarButtonItem?.setBackgroundImage(#imageLiteral(resourceName: "Star 2"), for: .normal, barMetrics: .default)

    
    }
    
//    @objc func addTapped() {
//        //dismiss(animated: true, completion: nil)
//
//        if isSelected {
//
//            isSelected = false
//
//            var botton = UIBarButtonItem(image: #imageLiteral(resourceName: "Star 2"), style: .plain, target: self, action: #selector(addTapped))
//            navigationItem.setRightBarButtonItems([botton], animated: true)
//
//            print("ok")
//
//        } else {
//
//            isSelected = true
//
//            var botton = UIBarButtonItem(image: #imageLiteral(resourceName: "Star"), style: .plain, target: self, action: #selector(addTapped))
//
//            navigationItem.setRightBarButtonItems([botton], animated: true)
//
////            navigationItem.rightBarButtonItem?.setBackgroundImage(#imageLiteral(resourceName: "Star"), for: .normal, barMetrics: .default)
//
//            print("okkk")
//
//        }
//
//
        /*
        navigationItem.rightBarButtonItem?.setBackgroundImage(#imageLiteral(resourceName: "Star"), for: .selected, barMetrics: .compact)
        
        if buttonState.isSelected {
            buttonState.backgroundColor = .white
            buttonState.isSelected = false
            buttonState.setImage(#imageLiteral(resourceName: "Star 2"), for: .normal)
            
            var indexToRemove: Int?
            
            for x in 1...booksArray.shared.books.count {
                print(booksArray.shared.books[x - 1].title)
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
            buttonState.isSelected = true
            
            buttonState.setImage(#imageLiteral(resourceName: "Star"), for: .selected)
            
            if let bookes = favouritesBooks.array(forKey: "myArray") as? [[String]]
            {
                let books = generatesBooksArray(books: bookes)
                booksArray.shared.books = books
            }
            if booksArray.shared.books.contains(where: { $0.title == book!.title })
            {
                //do nothing
            } else {
                booksArray.shared.books.append(book!)
                favouritesBooks.removeObject(forKey: "myArray")
                let myArray = createArray(books: booksArray.shared.books)
                favouritesBooks.set(myArray, forKey: "myArray")
            }
        }
        
        
       */
//    }
    
//    @IBOutlet weak var buttonState: UIButton!
//
//    @IBAction func changeState(_ sender: Any) {
//
//        if buttonState.isSelected {
//            buttonState.backgroundColor = .white
//            buttonState.isSelected = false
//            buttonState.setImage(#imageLiteral(resourceName: "Star 2"), for: .normal)
//
//            var indexToRemove: Int?
//
//            for x in 1...booksArray.shared.books.count {
//
//                if booksArray.shared.books[x - 1].title == book?.title {
//                    indexToRemove = x - 1
//                }
//            }
//
//            booksArray.shared.books.remove(at: indexToRemove!)
//            favouritesBooks.removeObject(forKey: "myArray")
//            let myArray = createArray(books: booksArray.shared.books)
//            favouritesBooks.set(myArray, forKey: "myArray")
//
//        } else {
//            //buttonState.backgroundColor = .red
//            buttonState.isSelected = true
//
//            buttonState.setImage(#imageLiteral(resourceName: "Star"), for: .selected)
//
//            if let bookes = favouritesBooks.array(forKey: "myArray") as? [[String]]
//            {
//                let books = generatesBooksArray(books: bookes)
//                booksArray.shared.books = books
//            }
//            if booksArray.shared.books.contains(where: { $0.title == book!.title })
//            {
//              //do nothing
//            } else {
//                booksArray.shared.books.insert(book!, at: 0)
//                favouritesBooks.removeObject(forKey: "myArray")
//                let myArray = createArray(books: booksArray.shared.books)
//                favouritesBooks.set(myArray, forKey: "myArray")
//            }
//        }
//    }
//
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
