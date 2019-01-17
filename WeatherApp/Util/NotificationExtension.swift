//
//  NotificationExtension.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let updateCities = Notification.Name("updatecities")
    static let showWeatherDetails = Notification.Name("showweatherdetails")
    static let errorWeatherDetails = Notification.Name("errorweatherdetails")
    static let updateWeather = Notification.Name("updateweather")
    static let updateCityName = Notification.Name("updatecityname")
}
