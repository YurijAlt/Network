//
//  DataManager.swift
//  Project Nasa
//
//  Created by SummeR on 30.04.2021.
//

struct DataManager {
    
   static let shared = DataManager()
    
    enum URLExamples: String {
        case apodImage = "https://api.nasa.gov/planetary/apod?api_key=z0owduoN1oOCl08yr0r6xd1rTHCWRbFLz7TXkhFa"
        case epicImage = "https://api.nasa.gov/EPIC/api/natural/images?api_key=z0owduoN1oOCl08yr0r6xd1rTHCWRbFLz7TXkhFa"
    }
    
   private init() {}
    
}
