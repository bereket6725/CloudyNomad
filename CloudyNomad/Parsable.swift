//
//  Parsable.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

protocol Parsable{
    associatedtype T
    func parseJSON(data: Data) -> T
}
