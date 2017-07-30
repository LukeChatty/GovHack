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
    @IBOutlet weak var textBox: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        riskRatingLabel.text = String(riskRating)
        
        colourBar(value: riskRating)
        
        text(name: self.title!)
        
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
    
    func text(name: String) {
        print(name)
        if name == "Belconnen" {
            textBox.text = "Belconnen is located in the North Western corner of Canberra. Located  at 35.2167°S, 149.0833°E, Belconnen is joint 2nd worst safety rating along with Tuggeranong and has the highest road fatality statistics."
        } else if name == "Gungahlin" {
            textBox.text = "Gunghalin is the most Northern region in ACT. It is located at 35.1831°S, 149.1330°E and has the least amount of road fatalities along with Weston Creek"
        } else if name == "North Canberra" {
            textBox.text = "North Canberra has the worst safety rating from all the regions in Canberra. Located in the Northern middle part of Canberra as the name suggests, 35.34378°S and 149.083°E. The main reason for North Canberra’s safety rating being so high is because it has a major city in the middle and therefore more people. This skewed the data."
        } else if name == "South Canberra" {
            textBox.text = "South Canberra is in the middle for safety rating. Located at 35.3051°S, 149.0981°E, South Canberra has a safety rating of 40 and has the joint lowest sexual assaults in the ACT."
        } else if name == "Tuggeranong" {
            textBox.text = "Tuggeranong is located at the very southern part of Canberra and is 2nd for worst safety rating. It has the highest sexual assaults in the ACT and is located at 35.4244°S, 149.0888°E."
        } else if name == "Weston Creek" {
            textBox.text = "Weston Creek is rated the Safest place to live in the ACT with a safety rating of 16. It is located at 35.3410°S, 149.0525°E and has 0 homicides! Weston Creek is located at the Southern West region of ACT."
        } else if name == "Woden" {
            textBox.text = "Woden is joint 2nd in best safety rating along with Gunghalin. Located at 35.3452°S, 149.0950°E and has a major shopping centre in Westfield so more people will skewer the stats for theft, assault and homicides."
        }
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
