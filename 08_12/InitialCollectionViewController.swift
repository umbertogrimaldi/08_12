//
//  InitialCollectionViewController.swift
//  08_12
//
//  Created by Bruno Riccardi on 15/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit




class InitialCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var genreCollection: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Select one or more genres"

        
        // Do any additional setup after loading the view.

            genreCollection.delegate = self
            genreCollection.dataSource = self

    }
    
    @IBAction func closeView(_ sender: Any) {
        
//        once the next button its pressed the view controller disappears
        dismiss(animated: true) {

        }
    }
    
    var genreArray: [String] = ["Romance","Thriller","Fiction","Fantasy","Biography"]

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        // niumber of item of collectionview
        return genreArray.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        populate the cell of collection view
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell

        let label = cell.viewWithTag(2) as! UILabel

        label.text = genreArray[indexPath.row]
        
        
        if cell.isSelected == true {
            cell.backgroundColor = .white
        }
        return cell
    }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        
        //   action when cell is selecteed
        cell!.backgroundColor = .white

        let myGenre = (genreArray[indexPath.row])
        
        titleLabel.text = "I'm interested in"
        
        savedGenre.set(myGenre, forKey: "myGenre")

    }

     func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        //  action when cell is deselected 
        cell!.backgroundColor = .blue
        savedGenre.removeObject(forKey: "myGenre")
    }
    

}
