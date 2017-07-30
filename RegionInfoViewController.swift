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
    var crimeValues = [Int]()
    var crimeNames = ["Homicides", "Sexual Assaults", "Assaults", "Traffic Infringements", "Robberies", "Car Thefts", "Thefts", "Road Fatalies", "Road Injuries"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var riskRatingLabel: UILabel!
    @IBOutlet weak var riskRatingBar: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        riskRatingLabel.text = String(riskRating)
        
        colourBar(value: riskRating)
        
        //riskRatingBar.roundCorners(corners: [.topRight, .bottomLeft, .bottomRight, .topLeft], radius: 10)
        
    }
    
    func colourBar(value: Int) {
        if value > 70 {
            riskRatingBar.backgroundColor = UIColor.red
        } else if value >= 40 {
            riskRatingBar.backgroundColor = UIColor.orange
        } else if value > 30 {
            riskRatingBar.backgroundColor = UIColor.yellow
        } else {
            riskRatingBar.backgroundColor = UIColor.green
        }
    }
    
    
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "crimeCell", for: indexPath) as! CrimeCell
        
        cell.crimeLabel.text = crimeNames[indexPath.row]
        cell.countLabel.text = String(crimeValues[indexPath.row])
        
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

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
