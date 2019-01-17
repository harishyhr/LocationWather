//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Harish on 15/01/19.
//  Copyright © 2019 Harish. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDataWithInValidCity() {
        let e = expectation(description: "Alamofire")
        
        APIManager.manager.fetchWeatherData(for: "mich igan") { (weather, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(weather)
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testGetDataWithValidCity() {
        let e = expectation(description: "Alamofire")
        
        APIManager.manager.fetchWeatherData(for: "michigan") { (weather, error) in
            XCTAssertNil(error, "Whoops, error \(error!.localizedDescription)")
            XCTAssertNotNil(weather)
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
