//
//  ViewController.swift
//  08_12
//
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var books: [Book] = []
    let storyGenerated = UserDefaults.standard
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return storyGenerated.object(forKey: key) != nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
        //favouritesBooks.removeObject(forKey: "myArray")
        // Do any additional setup after loading the view, typically from a nib.
       
        
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

