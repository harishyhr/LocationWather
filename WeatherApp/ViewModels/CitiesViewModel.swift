//
//  CitiesViewModel.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import UIKit

class CitiesViewModel: NSObject {
    private var citiesToShow: [City] = []
    
    func fetchCities() {
        citiesToShow = DataManager.manager.getCities()
        NotificationCenter.default.post(name: .updateCities, object: nil)
    }
    
    func fetchCitiesCount() -> Int {
        return citiesToShow.count
    }
    
    func fetchCity(at index: Int) -> City {
        return citiesToShow[index]
    }
}

extension CitiesViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchCitiesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityID", for: indexPath)
        let city = fetchCity(at: indexPath.row)
        cell.textLabel?.text = city.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = fetchCity(at: indexPath.row)
        DataManager.manager.fetchWeatherData(for: city.refname)
    }
}

extension CitiesViewModel: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let cityName = textField.text {
            DataManager.manager.fetchWeatherData(for: cityName)
        }
        return true
    }
}
