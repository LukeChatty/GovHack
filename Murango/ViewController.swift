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
    var crimeValues = [[String]]()
    
    @IBOutlet weak var Map: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        riskRatings = riskRating(dictionary: CSVDataToPoints(data: CSVDataToDictionary(data: readCSVFile(fileName: "CrimeStats", fileType: "csv"))))
        
        print(riskRatings)
        
        crimeValues = readCSVFile(fileName: "CrimeStats", fileType: "csv")
        
        print(crimeValues)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationNavigationController = segue.destination as! UINavigationController
        let targetController = destinationNavigationController.topViewController as! RegionInfoViewController

        let title = segue.identifier!
        targetController.title = title
        targetController.riskRating = riskRatings[title]!
    }
    



}

