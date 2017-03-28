//
//  WeatherModel.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/20/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

struct WeatherModel: Parsable{
    
    static func parseJSON(data: Data) -> [WeatherModel] {
        return [WeatherModel]()
    }
}
