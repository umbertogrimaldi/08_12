//
//  detailsViewController.swift
//  08_12
//
//  Created by Bruno Riccardi on 09/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {
    
    @IBOutlet weak var detailTitle: UITextField!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailText: UITextView!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        tabBarController?.tabBar.isHidden = true

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
