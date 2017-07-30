//
//  RegionInfoViewController.swift
//  Durango.AxisPowers.Tech
//
//  Created by Luke Chatfield on 30/7/17.
//  Copyright © 2017 Nathan Heldon. All rights reserved.
//

import UIKit

class RegionInfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var riskRating = Int()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var riskRatingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        riskRatingLabel.text = "Risk Rating: \(String(riskRating))"
        
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "crimeCell", for: indexPath) as! CrimeCell
        
        cell.crimeLabel.text = "Homicide"
        cell.countLabel.text = "2"
        
        return cell
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
