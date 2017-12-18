//
//  ViewControllerTableView.swift
//  08_12
//
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

// since the favouritesBooks userDefaults takes only string this function translate an array of string into an array of book


func generatesBooksArray(books: [[String]]) -> [Book] {
    var finalArray:  [Book] = []
    for elem in books {
        let book: Book = Book(image: "", title: "", text: "", author: "", category: "")
        book.title = elem[0]
        book.text = elem[1]
        book.image = elem[2]
        book.author = elem[3]
        book.category = elem[4]
        
        finalArray.append(book)
    }
    return finalArray
}



class ViewControllerTableView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     var books: [Book] = []

    @IBOutlet weak var booksTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // updates the table view if a genere was cliked before
        
        if let bookes = favouritesBooks.array(forKey: "myArray") as? [[String]] {
          books = generatesBooksArray(books: bookes)
          booksTableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        populates the table view
        return (books.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        creates the cells that go into the table view
        let book = books[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "myBookCell", for: indexPath) as! TableViewCell
        cell.setBook(book: book)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        check if the row was selected
        let book = books[indexPath.row]
        
        performSegue(withIdentifier: "toDetails", sender: book)
    }
    
//    once a row is selected it sends the info of the book to the next view conroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let destVC = segue.destination as! detailsViewController
            destVC.book = sender as? Book
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        allows user to delete rows of the table
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
//         remove the row if the user is deleteng
        if editingStyle == .delete{
            
            books.remove(at: indexPath.row)
            booksArray.shared.books = books
            favouritesBooks.removeObject(forKey: "myArray")
            let myArray = createArray(books: booksArray.shared.books)
            favouritesBooks.set(myArray, forKey: "myArray")
            
            booksTableView.beginUpdates()
            booksTableView.deleteRows(at: [indexPath], with: .automatic)
            booksTableView.endUpdates()
            
        }
    }
    
}

// making the tab bar appear disapperar depending on the viewcontroller

extension ViewControllerTableView: UINavigationControllerDelegate {

     func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if viewController is detailsViewController {
            viewController.tabBarController?.tabBar.isHidden = true
            if #available(iOS 11.0, *) {
                viewController.navigationController?.navigationBar.prefersLargeTitles = false
            } else {
                // Fallback on earlier versions
            }
        }
        else {
            viewController.tabBarController?.tabBar.isHidden = false
            if #available(iOS 11.0, *) {
                viewController.navigationController?.navigationBar.prefersLargeTitles = true
            } else {
                // Fallback on earlier versions
            }
        }
    }
}


