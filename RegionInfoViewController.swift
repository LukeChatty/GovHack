//
//  RegionInfoViewController.swift
//  Durango.AxisPowers.Tech
//
//  Created by Luke Chatfield on 30/7/17.
//  Copyright © 2017 Nathan Heldon. All rights reserved.
//

import UIKit

class RegionInfoViewController: UIViewController {
    
    
    @IBOutlet weak var riskRatingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        riskRatingLabel.text = "RISK RATING"
        
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

class CollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> CollectionViewCell {
        print(1)

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "crimeCell", for: indexPath as IndexPath) as! CollectionViewCell
        print(2)
        
        cell.crimeLabel.text = "Homicide"
        cell.countLabel.text = "2"
        
        return cell
    }

    
    
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var crimeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
}
