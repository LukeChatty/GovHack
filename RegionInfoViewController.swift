//
//  RegionInfoViewController.swift
//  Durango.AxisPowers.Tech
//
//  Created by Luke Chatfield on 30/7/17.
//  Copyright © 2017 Nathan Heldon. All rights reserved.
//

import UIKit

class RegionInfoViewController: UIViewController {
    
    var riskRating = Int()
    
    
    @IBOutlet weak var riskRatingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        riskRatingLabel.text = "Risk Rating: \(String(riskRating))"
        
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
