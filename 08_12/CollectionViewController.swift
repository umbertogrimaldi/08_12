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
        let itemSize: Double = Double(UIScreen.main.bounds.width/3 - 4)
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsetsMake(2, 3, 2, 3)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        myCollection.collectionViewLayout = layout
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        myCollection.backgroundColor = nil
        
        
        
        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "genreCell")
        // Do any additional setup after loading the view.
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
    var genreArray: [String] = ["Romance","Thriller","Fiction","Fantasy","Biography"]
    
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
        
        let label = cell.viewWithTag(2) as! UILabel
        
        label.text = genreArray[indexPath.row]
        
        if cell.isSelected == true {
            cell.backgroundColor = .white
        }
        
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
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
            cell!.backgroundColor = .blue
            savedGenre.removeObject(forKey: "myGenre")
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
