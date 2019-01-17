//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import UIKit

struct CityViewModel {
    let timeStamp: String
    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let pressure: Double
}

class WeatherViewModel: NSObject {
    var cityName: String = "" {
        didSet {
            NotificationCenter.default.post(name: .updateCityName, object: nil)
        }
    }
    
    var weatherList: [CityViewModel] = [] {
        didSet {
            NotificationCenter.default.post(name: .updateWeather, object: nil)
        }
    }
    
    func prepareData() {
        cityName = DataManager.manager.getCityName()
        if let obj = DataManager.manager.getWeatherList() {
            weatherList = obj.map({ (obj) -> CityViewModel in
                return CityViewModel(timeStamp: obj.dateText, temperature: obj.mainData.temperature, minTemperature: obj.mainData.minTemperature, maxTemperature: obj.mainData.maxTemperature, pressure: obj.mainData.pressure)
            })
        } else {
            weatherList = []
        }
    }
}


extension WeatherViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.cellID, for: indexPath) as! WeatherTableViewCell
        
        let cityObj = weatherList[indexPath.row]

        cell.timeStamp.text = "\(cityObj.timeStamp)"
        cell.temperature.text = "\(cityObj.temperature)"
        cell.minTemperature.text = "\(cityObj.minTemperature)"
        cell.maxTemperature.text = "\(cityObj.maxTemperature)"
        cell.pressure.text = "\(cityObj.pressure)"
        
        return cell
    }
}
