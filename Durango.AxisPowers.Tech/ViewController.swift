//
//  ViewController.swift
//  Durango.AxisPowers.Tech
//
//  Created by Nathan Heldon on 28/7/17.
//  Copyright © 2017 Nathan Heldon. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    var riskRatings = [String: Int]()
    
    @IBOutlet weak var Map: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(readFile())
        riskRatings = readFile()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationNavigationController = segue.destination as! UINavigationController
        let targetController = destinationNavigationController.topViewController as! RegionInfoViewController

        var title = segue.identifier
        targetController.title = title
        //targetController.riskRating = riskRatings[title]
    }
    



}

