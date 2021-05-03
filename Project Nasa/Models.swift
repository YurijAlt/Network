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
}
