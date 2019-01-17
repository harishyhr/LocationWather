//
//  WeatherLibrary.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import Foundation

protocol WeatherLibrary {
    func fetchWeatherData(for city: String)
    func getCityName() -> String
    func getWeatherList() -> [WeatherData]?
}
