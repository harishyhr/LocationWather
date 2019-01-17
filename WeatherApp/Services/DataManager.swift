//
//  DataManager.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import Foundation

class DataManager: NSObject, WeatherLibrary {
    private var cities: [City] = []
    private var weather: Weather?
    static let manager = DataManager()
    
    override private init() {
        super.init()
        createCities()
    }
    
    private func createCities() {
        let city1 = City(identifier: 0, name: "Michigan", refname: "michigan")
        cities.append(city1)
        
        let city2 = City(identifier: 1, name: "New York", refname: "new york")
        cities.append(city2)
        
        let city3 = City(identifier: 2, name: "Settle", refname: "seattle")
        cities.append(city3)
        
        let city4 = City(identifier: 3, name: "Dallas", refname: "dallas")
        cities.append(city4)
        
        let city5 = City(identifier: 5, name: "San Francisco", refname: "San Francisco")
        cities.append(city5)
        
        let city6 = City(identifier: 6, name: "Boston", refname: "Boston")
        cities.append(city6)
        
        let city7 = City(identifier: 7, name: "Nashville", refname: "Nashville")
        cities.append(city7)
        
        let city8 = City(identifier: 8, name: "Atlanta", refname: "Atlanta")
        cities.append(city8)
        
        let city9 = City(identifier: 9, name: "Florida", refname: "Florida")
        cities.append(city9)
        
        let city10 = City(identifier: 10, name: "Edison", refname: "Edison")
        cities.append(city10)
        
        let city11 = City(identifier: 11, name: "San Jose", refname: "San Jose")
        cities.append(city11)
        
        let city12 = City(identifier: 12, name: "Denver", refname: "Denver")
        cities.append(city12)
        
        let city13 = City(identifier: 13, name: "Portland", refname: "Portland")
        cities.append(city13)
        
        let city14 = City(identifier: 14, name: "New Orleans", refname: "New Orleans")
        cities.append(city14)
        
        let city15 = City(identifier: 15, name: "Miami", refname: "Miami")
        cities.append(city15)
    }
    
    func getCities() -> [City] {
        return cities;
    }
    
    func fetchWeatherData(for city: String) {
        APIManager.manager.fetchWeatherData(for: city) { (weather, error) in
            if weather != nil {
                self.weather = weather
                NotificationCenter.default.post(name: .showWeatherDetails , object: nil)
            } else {
                NotificationCenter.default.post(name: .errorWeatherDetails, object: error)
            }
        }
    }
    
    func getCityName() -> String {
        return weather?.city.name ?? "-"
    }
    
    func getWeatherList() -> [WeatherData]? {
        if let wthr = weather {
            return wthr.list
        }
        
        
        return nil
    }
}
