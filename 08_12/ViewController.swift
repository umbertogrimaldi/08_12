//
//  ViewController.swift
//  08_12
//  comment
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

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
       
        // generates a random book from the class/database book
        
        var books = Book.createBooksArray()
        let randomIndexx = Int(arc4random_uniform(UInt32(books.count)))
        let generatedBook = books[randomIndexx]

     //   storyGenerated.removeObject(forKey: "MikeyMouse")
     //   storyGenerated.removeObject(forKey: "MuttiSauce")
     //   storyGenerated.removeObject(forKey: "BrunoEUmberto")
     //    while isKeyPresentInUserDefaults(key: generatedBook.title) {
     //       var randomIndex = Int(arc4random_uniform(UInt32(books.count)))
     //       var generatedBook = books[randomIndex]
     //   }
     //   storyGenerated.set(true, forKey: generatedBook.title)
        
       /*
        let data = request(categoria: "Love")
        let json = parseData(data!)
        // print(json)
        // OpenLibrary
        // let categoriaArray: NSArray = (json!["works"] as? NSArray)!
        let categoriaArray: NSArray = (json!["texts"] as? NSArray)!
        // umc 12 dec. 23:48 book chosen randomly
        // https://stackoverflow.com/questions/24003191/pick-a-random-element-from-an-array
        let randomIndex = Int(arc4random_uniform(UInt32(categoriaArray.count)))
        let categoria: NSDictionary = categoriaArray[randomIndex] as! NSDictionary
        // con OpenLibrary
        // print(categoria["cover_id"])
        let textId = categoria["text_id"]
        print(textId)
        // umc 12 dec. 23:48 added two constants author and title from categoria["author"] and categoria["title"]
        let author = categoria["author"]!
        let titles = categoria["title"]!
        let x =  String(describing: titles)
        let y =  String(describing: author)
        print (x,y)
        //let generatedBook = Book(image: "mutti.jpg" ,title: x , text: y)
        */
        
        //for key in savedGenre.dictionaryRepresentation(){
            //print(key)
            //if key.key == "BrunoEUmberto" {print (key);storyGenerated.removeObject(forKey: "myArray")}
        //}
        
        
        //  once the button generate story is selected send the sory to the next viewcontroller
        if segue.identifier == "sendRandom" {
                let destinationVC = segue.destination as! ViewControllerReadGeneratedStory
                destinationVC.book = generatedBook
            }
    }
    
    func request(categoria: String) -> Data? {
        guard let url = URL(string: "https://gutenbergapi.org/search/subject%20eq%20\(categoria)?include=author,title,language")
            else {
                return nil
        }
        guard let data = try? Data(contentsOf: url)
            else {
                print("error")
                return nil
        }
        return data
    }
    func parseData(_ data: Data) -> NSDictionary? {
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            return (json as? NSDictionary)
        } catch _ {
            print("[ERROR] An error has happened with parsing of json data")
            return nil
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationController?.delegate = self
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        
        self.setupButtonSizes()
        self.setupButtonFonts()
        
        
        favouritesBooks.removeObject(forKey: "myArray")
        
        // Do any additional setup after loading the view, typically from a nib.
       
        
        // check if user has already launched the initial screen
        
        let bol = firstLaunch.bool(forKey: "isFirstLaunch")
        
        print(bol)
        
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
