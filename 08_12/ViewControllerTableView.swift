//
//  ViewControllerTableView.swift
//  08_12
//
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

func generatesBooksArray(books: [[String]]) -> [Book] {
    var finalArray:  [Book] = []
    for elem in books {
        let book: Book = Book(image: "",title: "", text: "")
        book.title = elem[0]
        book.text = elem[1]
        book.image = elem[2]
        finalArray.append(book)
    }
    return finalArray
}


class ViewControllerTableView: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var booksTableView: UITableView!

    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let bookes = favouritesBooks.array(forKey: "myArray") as? [[String]]
        {
          books = generatesBooksArray(books: bookes)
          booksTableView.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (books.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = books[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "myBookCell", for: indexPath) as! TableViewCell
        cell.setBook(book: book)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let book = books[indexPath.row]
        
        performSegue(withIdentifier: "toDetails", sender: book)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let destVC = segue.destination as! detailsViewController
            destVC.book = sender as? Book
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
