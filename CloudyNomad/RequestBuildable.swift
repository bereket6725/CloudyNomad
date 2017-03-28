//
//  RequestBuildable.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

//this will be the foundation that all our Networkers will share to make requests
protocol RequestBuildable{
    var requestType: RequestType { get }
    var endpoint: URL? { get }
}
