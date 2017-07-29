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
    //print(readCSVFile(fileName: "CrimeStats", fileType: "csv"))
    print(CSVDataToPoints(data: readCSVFile(fileName: "CrimeStats", fileType: "csv")))
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

func CSVDataToPoints(data: [[String]]) -> [String: [Int]] {
    let pointsArray = [1, 2, 26, 81, 7, 53, 36, 47, 70]
    
    var results = ["Region": [Int]()]
    
    for i in 0 ... data.count-1 {
        print(data[i][0])
        var array = [Int]()
        for j in 1...data[i].count-1 {
            array.append(Int(data[i][j])! * pointsArray[j-1])
        }
        results[data[i][0]] = array
    }
    
    return results
    
}

