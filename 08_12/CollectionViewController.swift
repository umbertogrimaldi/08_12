//
//  CollectionViewController.swift
//  08_12
//
//  Created by Bruno Riccardi on 13/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "genreCell"

let savedGenre = UserDefaults.standard

class CollectionViewController: UICollectionViewController {
    
    @IBOutlet var myCollection: UICollectionView!
    
    
    var genreArray: [String] = ["Adventure Fiction", "Biography", "Children's book", "Detective", "Drama", "Fantasy", "Horror", "Novel", "Philosophy", "Political Fiction", "Romance", "Southern Gothic"]
    
    var genreArraySelected: [String] = ["adventure fiction", "biography", "children's book", "detective", "drama", "fantasy", "horror", "novel", "philosophy", "political fiction", "romance", "southern gothic"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
            self.clearsSelectionOnViewWillAppear = false
        
            if let myGenre = savedGenre.object(forKey: "myGenre") as? String {
                var myRow: Int?
                for x in 1...genreArray.count {
                    if myGenre == genreArray[x-1] {
                    myRow = x - 1
                }
            }
            let indexPath = IndexPath(row: myRow!, section: 0)
            myCollection.selectItem(at: indexPath, animated: true, scrollPosition: .top)
        }
        
//        COLLECTION VIEW LAYOUT
        let itemSize: Double = Double(UIScreen.main.bounds.width/3 - 10)
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsetsMake(10, 7, 7, 7)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        myCollection.collectionViewLayout = layout
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 7
//        myCollection.backgroundColor = nil
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "genreCell")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }
            //let buttonTitle = buttonState.titleLabel as! String
            //savedGenre.removeObject(forKey: "myGenre")
            //savedGenre.set(true, forKey: buttonTitle)
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return genreArray.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as UICollectionViewCell
            cell.layer.cornerRadius = 6
//        cell.layer.shadowColor = UIColor.gray.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
//        cell.layer.shadowOpacity = 200
//        cell.layer.shadowRadius = 4.0
//        cell.clipsToBounds = false
//        
    let label = cell.viewWithTag(2) as! UILabel
            label.text = genreArray[indexPath.row]
    let cellImageView = cell.viewWithTag(3) as! UIImageView
    let itemSize: Double = Double(UIScreen.main.bounds.width/3 - 10)
            cellImageView.image = UIImage(named: genreArray[indexPath.row])
            cellImageView.frame.size = CGSize(width: itemSize, height: itemSize)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    //Uncomment this method to specify if the specified item should be selected
   // override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {}
  
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
            cell!.backgroundColor = .white

        let myGenre = (genreArray[indexPath.row])
        savedGenre.set(myGenre, forKey: "myGenre")
        let cellImageView = cell?.viewWithTag(3) as! UIImageView
        cellImageView.image = UIImage(named: genreArraySelected[indexPath.row])
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
//            cell!.backgroundColor = .blue
            savedGenre.removeObject(forKey: "myGenre")
        let cellImageView = cell?.viewWithTag(3) as! UIImageView
        cellImageView.image = UIImage(named: genreArray[indexPath.row])
     

    }
 

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
