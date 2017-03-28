//
//  String.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/27/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

typealias TimeZone = String

extension TimeZone: Parsable{
    static func parseJSON(data: Data) -> [TimeZone]{
        return [TimeZone]()
    }    
}
