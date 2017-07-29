//
//  ReadCSV.swift
//  Durango.AxisPowers.Tech
//
//  Created by Luke Chatfield on 29/7/17.
//  Copyright © 2017 Nathan Heldon. All rights reserved.
//

import Foundation

func readCSVFile(fileName:String, fileType: String)-> [[String]]!{
    guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
        else {
            return nil
    }
    do {
        let contents = try String(contentsOfFile: filepath, encoding: .utf8)
        let array = CSVToArray(data: contents)
        return array
        
    } catch {
        print("File Read Error for file \(filepath)")
        return nil
    }
}


func readFile() {
    print(safetyRating(dictionary: CSVDataToPoints(data: readCSVFile(fileName: "CrimeStats", fileType: "csv"))))
}


func CSVToArray(data: String) -> [[String]] {
    var result: [[String]] = []
    let rows = data.components(separatedBy: "\r\n")
    
    for row in rows {
        let columns = row.components(separatedBy: ",")
        result.append(columns)
    }
    
    return result
    
}

func CSVDataToPoints(data: [[String]]) -> [String: [Double]] {
    print("")
    let pointsArray = [1, 0.625, 0.5, 0.003125, 0.375, 0.375, 0.25, 0.5, 0.075]
    
    var results = [String:[Double]]()
    
    for i in 0 ... data.count-1 {
        
        print(data[i][0])
        var array = [Double]()
        for j in 1...data[i].count-1 {
            let amendedData = Int(data[i][j])! * 100
            var amendedDataDouble = Double(amendedData)
            amendedDataDouble = amendedDataDouble * pointsArray[j-1]
            array.append(amendedDataDouble)
        }
        
        results[data[i][0]] = array
        
    }
    
    return results
    
}

func safetyRating(dictionary: [String: [Double]]) -> [String: Int] {
    
    var safetyValues = [String: Int]()
    
    for region in dictionary {
        var regionTotal = 0.00
        for points in region.value {
            regionTotal += points
        }
        
        safetyValues[region.key] = Int(round(regionTotal / 10000) * 2)
        
    }
    
    return safetyValues

}

