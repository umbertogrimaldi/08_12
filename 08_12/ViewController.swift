//
//  ViewController.swift
//  08_12
//  comment
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit
var myAuthor = ""
var myTitle = ""
var myText = ""


class ViewController: UIViewController {

    @IBOutlet weak var generateButton: UIButton!
    
    var books: [Book] = []
    let storyGenerated = UserDefaults.standard
    
    var firstLaunch = UserDefaults.standard
    
    let bigNumberSize: CGSize = CGSize(width: 112, height: 88)
    let bigNumberPosition: CGPoint = CGPoint(x: 131, y: 20)
    let bigNumberFont = UIFont(name: "HelveticaNeue-Medium", size: 100)
    let smallNumberSize: CGSize = CGSize(width: 81, height: 58)
    let smallNumberPositionY: CGFloat = 35
    let smallNumberFont = UIFont(name: "HelveticaNeue-UltraLight", size: 72)
    var bigNumberIndex = 0
    
    @IBOutlet var numbersSwipeCollection: [UILabel]!
    
    
    @IBOutlet var swipeRight: UISwipeGestureRecognizer!
    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return storyGenerated.object(forKey: key) != nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        
        //var books = Book.createBooksArray()
        //et randomIndexx = Int(arc4random_uniform(UInt32(books.count)))

        //let generatedBook = books[randomIndexx]
        
       // let genre = savedGenre.string(forKey: "myGenre")
        
        
        //let generatedBook = downloadJSON(category: genre)
        
        //let generatedBookArray = downloadJSON(category: "Love%20stories")
        
        downloadJSON(category: "Love%20stories")
        
//        sleep(7)
        
        
        let generatedBook = Book(image: "mikey.jpg", title: myTitle , text: myText, author: myAuthor, category: "love")
        
        
        var bookText = generatedBook.text
        
        bookText = textForMinutes(testo: bookText , minuti: myNumbMin)
        
        
        generatedBook.text = bookText
        
        print(bookText)
        
        
        if segue.identifier == "sendRandom" {
                let destinationVC = segue.destination as! ViewControllerReadGeneratedStory
                destinationVC.book = generatedBook
            }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        generateButton.layer.cornerRadius = 30
        generateButton.backgroundColor = .white
        generateButton.layer.shadowColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0).cgColor
        generateButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        generateButton.layer.shadowOpacity = 10
        generateButton.layer.shadowRadius = 2.0
        generateButton.clipsToBounds = false

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationController?.delegate = self
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        
//        for the numbers in the time section
        
        self.setupButtonSizes()
        self.setupButtonFonts()
        
        favouritesBooks.removeObject(forKey: "myArray")
        
        // Do any additional setup after loading the view, typically from a nib.
       
        
        // check if user has already launched the initial screen
        
        
        
        
        let bol = firstLaunch.bool(forKey: "isFirstLaunch")
        
        if  bol  {
            // Don nothing
            firstLaunch.set(false, forKey: "isFirstLaunch")
            
        } else {
            
            firstLaunch.set(true, forKey: "isFirstLaunch")
            
            // get the view controller from the initialViewstoryboard
            
            let initialView = UIStoryboard(name: "initialView", bundle: nil) . instantiateViewController(withIdentifier: "bruno")
            
            // present the view controller
            present(initialView, animated: true)
            
        }
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var myNumbMin: String = "5"
    
    @IBAction func swipeTheNumber(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        
        case  UISwipeGestureRecognizerDirection.left:
            
            if bigNumberIndex != numbersSwipeCollection.count - 1 {
                
                bigNumberIndex += 1
                self.setupButtonSizes()
                self.setupButtonFonts()
                
                for i in 0 ... self.numbersSwipeCollection.count - 1 {
                    if i == self.bigNumberIndex {
                        
                        self.numbersSwipeCollection[i].frame.origin.y = self.bigNumberPosition.y
                        UIView.animate(withDuration: 0.3, animations: {
                            self.numbersSwipeCollection[i].frame.origin.x = self.bigNumberPosition.x
                            
                            self.myNumbMin = self.numbersSwipeCollection[i].text!
                        })
                    } else {
                        self.numbersSwipeCollection[i].frame.origin.y = self.smallNumberPositionY
                        UIView.animate(withDuration: 0.3, animations: {
                            self.numbersSwipeCollection[i].frame.origin.x -= self.smallNumberSize.width
                        })
                    }
                    
                }
                
            }
            
            break
        case  UISwipeGestureRecognizerDirection.right:
            if bigNumberIndex != 0 {
                bigNumberIndex -= 1
                self.setupButtonSizes()
                self.setupButtonFonts()
                for i in 0 ... self.numbersSwipeCollection.count - 1 {
                    if i == self.bigNumberIndex {
                        
                        self.numbersSwipeCollection[i].frame.origin.y = self.bigNumberPosition.y
                        UIView.animate(withDuration: 0.3, animations: {
                            self.numbersSwipeCollection[i].frame.origin.x = self.bigNumberPosition.x
                            
                            self.myNumbMin = self.numbersSwipeCollection[i].text!
                        })
                    } else {
                        self.numbersSwipeCollection[i].frame.origin.y = self.smallNumberPositionY
                        if i != bigNumberIndex + 1 {
                            UIView.animate(withDuration: 0.3, animations: {
                                self.numbersSwipeCollection[i].frame.origin.x += self.smallNumberSize.width
                            })
                        } else {
                            UIView.animate(withDuration: 0.3, animations: {
                                self.numbersSwipeCollection[i].frame.origin.x += self.bigNumberSize.width
                            })
                        }
                    }
                    
                }
            }
            
            break
        default:
            print ("other")
            break
        }
    
//      print("ok")
//        print((myNumbMin))
//      print("ok")
        
    }
    
    
    private func setupButtonSizes() {
        for i in 0 ... self.numbersSwipeCollection.count - 1 {
            if i == self.bigNumberIndex {
                self.numbersSwipeCollection[i].frame.size = self.bigNumberSize
            } else {
                self.numbersSwipeCollection[i].frame.size = self.smallNumberSize
            }
        }
    }
    
    private func setupButtonFonts() {
        for i in 0 ... self.numbersSwipeCollection.count - 1 {
            if i == self.bigNumberIndex {
                self.numbersSwipeCollection[i].font = self.bigNumberFont
            } else {
                self.numbersSwipeCollection[i].font = self.smallNumberFont
            }
        }
    }
}

// function that takes the words per minutes to read

func textForMinutes(testo: String, minuti: String) -> String {
    
    var testoPerMinuti = ""
    let wordsPerMinute = 150
    let separatTextInWords = testo.components(separatedBy: " ")
    
    let totalWords = (Int(minuti)! * wordsPerMinute) - 1
    
    var newTextArray = separatTextInWords[0...separatTextInWords.count - 1 ]
    
    if totalWords <= separatTextInWords.count {
       
        newTextArray = separatTextInWords[0...totalWords]
    }
    testoPerMinuti = newTextArray.joined(separator: " ")
    
    print("pippo")
    print(minuti)
    print(newTextArray.count)
    
    return testoPerMinuti
}

// making the tab bar appear disapperar depending on the viewcontroller

extension ViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        
        if viewController is ViewControllerReadGeneratedStory {
            viewController.tabBarController?.tabBar.isHidden = true
        }
        else {
            viewController.tabBarController?.tabBar.isHidden = false
        }
        
    }
}


///////////////////////////////////////////////// UMBERTO CODE ////////////////

func downloadJSON(category: String) {
    
//    var finalArray: [String] = []
    
    //        1. Set the url to call API from gutenbergapi.org. Then search books with: subject(the category) equal to "something" (be carefull, add %20 instaed of spaces e.g. use "Love%20stories", not "Love stories"), English language only and include title and author in the json data.
    var bookId = 0
    let jsonUrlString = "https://gutenbergapi.org/search/subject%20eq%20\(category)%20and%20language%20eq%20en?include=title,author"
    let url = URL(string: jsonUrlString)
    
    //        2. From the url, take the data (JSON) as "data", the response (200, 400, 404, 500...) as "response" and error as "error".
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
        guard let data = data else { return }
        if error == nil {
            do {
                //                    3. Decode the JSON data with the struct made, in this case, in the "BookIndex.swift" file. Then count how many books are in the index and choose one randomly.
                let booksIndex = try JSONDecoder().decode(BooksIndex.self, from: data)
                let booksCount = booksIndex.texts.count
                let randomBook = Int(arc4random_uniform(UInt32(booksCount)))
                let choosenBook = booksIndex.texts[randomBook]
                //                    4. Assign constants to extrapolated data, like the title, the author and the id of the randomly choosen book. Author and Title will be displayed in the book view, the id is used to take the text of the book.
                let bookTitle = choosenBook.title.joined(separator: " ")
                bookId = choosenBook.id
                let bookAuthor = choosenBook.author.joined(separator: " ")

//                self.bookId = bookId
//                self.bookTitle = bookTitle
//                self.bookAuthor = bookAuthor
                
                
                myTitle = bookTitle
                myAuthor = bookAuthor
                
//                print(bookAuthor)
                
                //finalArray.append(bookTitle)
                //finalArray.append(bookAuthor)
                //print("pippo")
                //print(finalArray)
                
                
                
                let jsonText = "https://gutenbergapi.org/texts/\(bookId)/body"
                let urlText = URL(string: jsonText)
                
                URLSession.shared.dataTask(with: urlText!) { (data, response, error) in
                    guard let data = data else { return }
                    if error == nil {
                        do {
                            let bookText = try JSONDecoder().decode(BodyText.self, from: data)
//
//                            finalArray.append(bookText.body)
//                            print("pippo2")
//                            print(finalArray)
                            myText = bookText.body
                            
                        } catch {
                            print("BookText – JSON Error")
                        }
                    } else { print("BookText – Response: \(response) – Error: \(error).") }
                    }.resume()
                
            } catch {
                print("JSON Error")
            }
        } else { print("Response: \(response) – Error: \(error).")
            
            //    return finalArray
        }
        }.resume()
    

}



