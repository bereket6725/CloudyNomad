//
//  NetworkType.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/21/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire


enum Result <T, E:Error>{
    case success(T)
    case failure(E)
}

enum RequestType{
    case get
    case post
    
    var methodType: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post([String: Any]):
            return .post
        }
    }
}
