//
//  Parsable.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
//allows our models to handle its own parsing
protocol Parsable{
    associatedtype T
    static func parseJSON(data: Data) -> T
}
