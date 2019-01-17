//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import Foundation

struct Main: Codable {
    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let pressure: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case pressure = "pressure"
    }
}

struct WeatherData: Codable {
    let date: Double
    let dateText: String
    let mainData: Main
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case dateText = "dt_txt"
        case mainData = "main"
    }
}
