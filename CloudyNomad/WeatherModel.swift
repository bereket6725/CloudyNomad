//
//  WeatherModel.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/20/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

//object made from data gathered from the openWeatherMapsAPI 
struct WeatherModel: Parsable{
    static func parseJSON(data: Data) -> [WeatherModel] {
        return [WeatherModel]()
    }
}
