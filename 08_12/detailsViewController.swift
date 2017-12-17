//
//  detailsViewController.swift
//  08_12
//
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {
    
    var book: Book?
  
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailAuthor: UILabel!
    @IBOutlet weak var detailCategory: UILabel!
    @IBOutlet weak var detailCategoryView: UIView!
    @IBOutlet weak var detailText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        tabBarController?.tabBar.isHidden = true
        
        detailImage.backgroundColor = UIColor.purple
        
        
//        CATEGORY MODIFIES
        detailCategoryView.layer.cornerRadius = 9.0
        detailCategoryView.layer.borderWidth = 0.5
        detailCategoryView.layer.borderColor = UIColor.purple.cgColor
        detailCategory.textColor = .purple
        
//        TITLE MODIFIES
        detailTitle.textColor = UIColor(red:0.21, green:0.21, blue:0.21, alpha:1.0)
        
//        AUTHOR MODIFIES
        detailAuthor.textColor = UIColor(red:0.45, green:0.45, blue:0.45, alpha:1.0)
        
//        TEXT MODIFIES
        detailText.textColor = UIColor(red:0.21, green:0.21, blue:0.21, alpha:1.0)

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUI(){
      let myImagen = UIImage(named: book!.image)
        
        detailText.text = book?.text
        detailImage.image = myImagen
        detailTitle.text = book?.title
        detailAuthor.text = book?.author
        detailCategory.text = book?.category
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
