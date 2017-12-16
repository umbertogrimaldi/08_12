//
//  TableViewCell.swift
//  08_12
//
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myText: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    func setBook(book : Book)  {
        
         let myImagen = UIImage(named: book.image)
        
        myImage.image = myImagen
        myText.text = book.title
        category.text = book.category
        authorLabel.text = book.author
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryView.layer.cornerRadius = 9.0
        categoryView.layer.borderWidth = 1.0
        categoryView.layer.borderColor = UIColor.purple.cgColor
        category.textColor = .purple

        
//        TITLE MODIFIES
        myText.textColor = UIColor(red:0.21, green:0.21, blue:0.21, alpha:1.0)
        
//        AUTHOR MODIFIES
        authorLabel.textColor = UIColor(red:0.45, green:0.45, blue:0.45, alpha:1.0)
        
    }
    
    

}




