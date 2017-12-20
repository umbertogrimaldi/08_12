//
//  InitialCollectionViewController.swift
//  08_12
//
//  Created by Bruno Riccardi on 15/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

class InitialCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
//    path to images
    
    var genreArray: [String] = ["Adventure Fiction", "Biography", "Children's book", "Detective", "Drama", "Fantasy", "Horror", "Novel", "Philosophy", "Political Fiction", "Romance", "Southern Gothic"]
    
    var genreArraySelected: [String] = ["adventure fiction", "biography", "children's book", "detective", "drama", "fantasy", "horror", "novel", "philosophy", "political fiction", "romance", "southern gothic"]
    
    
    @IBOutlet weak var genreCollection: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleep(2)
 
        genreCollection.delegate = self
        genreCollection.dataSource = self
        
        let itemSize: Double = Double(UIScreen.main.bounds.width/3 - 10)
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsetsMake(10, 7, 7, 7)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        genreCollection.collectionViewLayout = layout
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 7
        
//        button editing
        nextButton.layer.cornerRadius = 20.5
        nextButton.layer.borderWidth = 2
        nextButton.layer.borderColor = UIColor(red:0.69, green:0.71, blue:0.71, alpha:1.0).cgColor
        
    }
    
    @IBAction func closeView(_ sender: Any) {
//        once the next button its pressed the view controller disappears
        dismiss(animated: true) 
        
    }


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
        cell.layer.cornerRadius = 6

        let label = cell.viewWithTag(2) as! UILabel
            label.text = genreArray[indexPath.row]
        
        let cellImageView = cell.viewWithTag(3) as! UIImageView
            cellImageView.image = UIImage(named: genreArray[indexPath.row])
        
        if cell.isSelected == true {
            cell.backgroundColor = .white
        }
        return cell
    }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        //   action when cell is selecteed
        let cellImageView = cell?.viewWithTag(3) as! UIImageView
        cellImageView.image = UIImage(named: genreArraySelected[indexPath.row])

        let myGenre = (genreArray[indexPath.row])
        savedGenre.set(myGenre, forKey: "myGenre")

    }

    
     func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        //  action when cell is deselected
        let cellImageView = cell?.viewWithTag(3) as! UIImageView
        cellImageView.image = UIImage(named: genreArray[indexPath.row])
        
        savedGenre.removeObject(forKey: "myGenre")
    }
    

}
