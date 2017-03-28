//
//  RequestBuilder.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire

enum Result <T, E:Error>{
    case success(T)
    case failure(E)
}


struct OpenWeatherMapsRequest{
}
struct GoogleTimeZoneRequest{
}
struct MeetupRequest{
}

enum RequestType{
    case get
    case post([String: Any])
    
    var methodType: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        }
    }
}

struct BaseURLStrings{
    fileprivate static let openWeatherMaps = ""
    fileprivate static let googleTimeZone = ""
    fileprivate static let Meetup = ""
}

