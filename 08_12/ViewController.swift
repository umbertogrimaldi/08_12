
//
//  ViewController.swift
//  08_12
//  comment
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit


var activityIndicator = UIActivityIndicatorView()

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let genre = savedGenre.string(forKey: "myGenre")
                var books = Book.createBooksArray(genere: genre!)
                let randomIndexx = Int(arc4random_uniform(UInt32(books.count)))
                let generatedBook = books[randomIndexx]
                var bookText = generatedBook.text
                bookText = textForMinutes(testo: bookText , minuti: myNumbMin)
                generatedBook.text = bookText
      
        if segue.identifier == "sendRandom" {
            let destination = segue.destination as! ViewControllerReadGeneratedStory
            destination.book = generatedBook
        
//            func downloadJSON(category: String) {
//            let category = "Love%20stories"
//                print("start")
//                //        1. Set the url to call API from gutenbergapi.org. Then search books with: subject(the category) equal to "something" (be carefull, add %20 instaed of spaces e.g. use "Love%20stories", not "Love stories"), English language only and include title and author in the json data.
//                let jsonUrlString = "https://gutenbergapi.org/search/subject%20eq%20\(category)%20and%20language%20eq%20en?include=title,author"
//                let url = URL(string: jsonUrlString)
//                URLSession.shared.dataTask(with: url!) { (data, response, error) in
//                    guard let data = data else { return }
//                    if error == nil {
//                        do {
//                            let booksIndex = try JSONDecoder().decode(BooksIndex.self, from: data)
//                            let booksCount = booksIndex.texts.count
//                            let randomBook = Int(arc4random_uniform(UInt32(booksCount)))
//                            let choosenBook = booksIndex.texts[randomBook]
//                            let bookTitle = choosenBook.title.joined(separator: " ")
//                            let bookId = choosenBook.id
//                            let bookAuthor = choosenBook.author.joined(separator: " ")
//                            let jsonText = "https://gutenbergapi.org/texts/\(bookId)/body"
//                            let urlText = URL(string: jsonText)
//                            URLSession.shared.dataTask(with: urlText!) { (data, response, error) in
//                                guard let data = data else { return }
//                                if error == nil {
//                                    do {
//                                        let bookText = try JSONDecoder().decode(BodyText.self, from: data)
//                                        let fullBookText = bookText.body
//                                        if fullBookText.contains("CHAPTER I")
//                                        {print("ok")
//                                            let result = fullBookText.range(of: "CHAPTER I", options: NSString.CompareOptions.literal, range: fullBookText.startIndex..<fullBookText.endIndex, locale: nil)
//                                            if let range = result {
//                                                let start = range.lowerBound
//
//                                                DispatchQueue.main.async { // Correct
//
//                                                    destination.bookText.text = textForMinutes(testo: String(fullBookText[start..<fullBookText.endIndex]), minuti: self.myNumbMin)
//                                                    //                                                    destination.bookText.text = String(fullBookText[start..<fullBookText.endIndex])
//                                                    destination.bookText.isHidden = false
//                                                    destination.bookAuthor.text = bookAuthor
//                                                    destination.bookAuthor.isHidden = false
//                                                    destination.bookTitle.text = bookTitle
//                                                    destination.bookTitle.isHidden = false
//
//
//                                                    activityIndicator.stopAnimating()
//                                                }
//                                            }
//                                        } else {
//                                            downloadJSON(category: category)
//                                        }
//                                    } catch {
//                                        print("BookText – JSON Error")
//
//                                    }
//                                } else { print("BookText – Response: \(String(describing: response)) – Error: \(String(describing: error)).") }
//                                }.resume()
//                        } catch {
//                            print("JSON Error")
//                        }
//                    } else { print("Response: \(String(describing: response)) – Error: \(String(describing: error)).") }
//                    }.resume()
//            }
//
//            downloadJSON(category: category)
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
        
        //for the numbers in the time section
        
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





