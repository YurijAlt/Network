//
//  AstronomicPictureOfTheDay.swift
//  Project Nasa
//
//  Created by SummeR on 30.04.2021.
//

struct APOD: Decodable {
    let date: String?
    let explanation: String?
    let title: String?
    let url: String?
    
    init(apodData: [String: Any]) {
            date = apodData["date"] as? String
            explanation = apodData["explanation"] as? String
            title = apodData["title"] as? String
            url = apodData["url"] as? String
    }
    
    static func getApods(from value: Any) -> [APOD] {
        guard let apodData = value as? [[String: Any]] else { return  [] }
        return apodData.compactMap { APOD(apodData: $0) }
    }
    
}
