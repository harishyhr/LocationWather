//
//  Weather.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let count: Int
    let list: [WeatherData]
    let city: WeatherCity
    
    enum CodingKeys: String, CodingKey {
        case count = "cnt"
        case list = "list"
        case city = "city"
    }
}
