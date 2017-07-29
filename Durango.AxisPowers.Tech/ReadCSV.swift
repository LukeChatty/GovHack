//
//  ReadCSV.swift
//  Durango.AxisPowers.Tech
//
//  Created by Luke Chatfield on 29/7/17.
//  Copyright © 2017 Nathan Heldon. All rights reserved.
//

import Foundation

func readCSVFile(fileName:String, fileType: String)-> String!{
    guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
        else {
            return nil
    }
    do {
        var contents = try String(contentsOfFile: filepath, encoding: .utf8)
        return contents
    } catch {
        print("File Read Error for file \(filepath)")
        return nil
    }
}


func readFile() {
    print(readCSVFile(fileName: "CrimeStats", fileType: "csv"))
}
