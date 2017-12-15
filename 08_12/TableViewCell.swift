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
    @IBOutlet weak var labelCategory: UILabel!
    
    func setBook(book : Book)  {
        
         let myImagen = UIImage(named: book.image)
        
        myImage.image = myImagen
        myText.text = book.title
        labelCategory.text = book.category
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelCategory.layer.cornerRadius = 5.0
        labelCategory.layer.borderWidth = 1.0
        labelCategory.layer.borderColor = UIColor.purple.cgColor
    }

}
