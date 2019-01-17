//
//  APIManager.swift
//  WeatherApp
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import Foundation
import Alamofire

public enum ErrorCode: Int {
    case noNetwork = 1001
    case userAuthFailed = 1002
    case searverFailuer = 1003
    case badRequest = 1004
    case tokenInvalid = 1005
    case invalidJson = 1006
}

class APIManager {
    let url = "https://api.openweathermap.org/data/2.5/forecast?appid=974d41eb3f7a1956a35f72e4c1492c0d&q="
    let kDomain = "com.harish.weatherapp"

    static let manager = APIManager()
    
    private init() {}
    
    private func createUserInfo(_ descriptionKey: String!, failureReason: String!) -> [String: Any] {
        return  [
            NSLocalizedDescriptionKey: NSLocalizedString(descriptionKey, comment: failureReason) ,
            NSLocalizedFailureReasonErrorKey: NSLocalizedString(descriptionKey, comment: failureReason)
        ]
    }
    
    func fetchWeatherData(for city: String, onCompletion: @escaping(_ weatherObj: Weather?, _ error: Error?) -> Void) {
        if Reach().isNetworkReachable() == true {
            let urlToHit = url + city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!

            AF.request(urlToHit).responseDecodable { (response: DataResponse<Weather>) in
                //onCompletion(response, nil)
                if response.error != nil {
                    onCompletion(nil, response.error)
                } else {
                    onCompletion(response.value, nil)
                }
            }
        } else {
            let userInfo = self.createUserInfo("No Network availale", failureReason: "No Network")
            let error = NSError(domain: kDomain, code: ErrorCode.noNetwork.rawValue, userInfo: userInfo)
            onCompletion(nil, error)
        }
    }
}
