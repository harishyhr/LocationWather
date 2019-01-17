//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    var weatherModel: WeatherViewModel?
    
    @IBOutlet weak var weatherDetails: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(updateTitle), name: .updateCityName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: .updateWeather, object: nil)

        if let wm = weatherModel {
            weatherDetails.dataSource = wm
            wm.prepareData()
        }
    }
    
    @objc func update() {
        weatherDetails.reloadData()
    }
    
    @objc func updateTitle() {
        title = weatherModel?.cityName ?? "Weather Details"
    }
}
