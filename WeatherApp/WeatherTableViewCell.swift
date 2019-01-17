//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    static let cellID = "WeatherCellID"
    
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var pressure: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
