//
//  City.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import Foundation

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}

struct WeatherCity: Codable {
    let identifier: Int;
    let name: String;
    let coordinates: Coordinate;
    let country: String;
    let population: Int;
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
        case coordinates = "coord"
        case country = "country"
        case population = "population"
    }
}
