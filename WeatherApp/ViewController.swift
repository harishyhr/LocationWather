//
//  ViewController.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import UIKit



//11. this is a mainviewcontroller
class ViewController: UIViewController {
    var dataModel = CitiesViewModel()
    
    @IBOutlet weak var cityNameTextBox: UITextField!
    @IBOutlet weak var citiesList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Cities"
        citiesList.dataSource = dataModel
        citiesList.delegate = dataModel
        cityNameTextBox.delegate = dataModel
        
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: .updateCities, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showWeatherDetails), name: .showWeatherDetails, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showError(notification:)), name: .errorWeatherDetails, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        dataModel.fetchCities()
    }
    
    @objc func update() {
        self.citiesList.reloadData()
    }
    
    @objc func showWeatherDetails() {
        performSegue(withIdentifier: "WeatherDetails", sender: nil)
    }
    
    @objc func showError(notification: NSNotification) {
        let obj = notification.object as! Error
        showAlert(message: obj.localizedDescription)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WeatherDetails" {
            let viewModel = WeatherViewModel()
            
            if let vc = segue.destination as? WeatherDetailsViewController {
                vc.weatherModel = viewModel
            }
        }
    }
}
