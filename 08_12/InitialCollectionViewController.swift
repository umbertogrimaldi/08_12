//
//  InitialCollectionViewController.swift
//  08_12
//
//  Created by Bruno Riccardi on 15/12/2017.
//  Copyright © 2017 Bruno Riccardi. All rights reserved.
//

import UIKit


var firstLaunch = UserDefaults.standard

class InitialCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var genreCollection: UICollectionView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bol = firstLaunch.bool(forKey: "isFirstLaunch")
        
        if bol {
            
            firstLaunch.set(false, forKey: "isFirstLaunch")
            
            
            
        } else {
            
        }
        
            
            firstLaunch.set(true, forKey: "isFirstLaunch")
            
            //self.genreCollection.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            genreCollection.backgroundColor = UIColor.red
            
            genreCollection.delegate = self
            genreCollection.dataSource = self
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     */
    
    var genreArray: [String] = ["Romance","Thriller","Fiction","Fantasy","Biography"]

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return genreArray.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as UICollectionViewCell

        let label = cell.viewWithTag(2) as! UILabel

        label.text = genreArray[indexPath.row]

        if cell.isSelected == true {
            cell.backgroundColor = .white
        }
        return cell
    }


     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell!.backgroundColor = .white

        let myGenre = (genreArray[indexPath.row])

        savedGenre.set(myGenre, forKey: "myGenre")

    }

     func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath)
        cell!.backgroundColor = .blue
        savedGenre.removeObject(forKey: "myGenre")
    }

}
