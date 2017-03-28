//
//  RequestBuildable.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

protocol RequestBuildable{
    var requestType: RequestType { get }
    var endpoint: URL? { get }
}
