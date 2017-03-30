//
//  RequestBuilder.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire

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

struct ApiKeys{
    fileprivate static let openWeatherMaps = "26db8fa456dbb4ac68876d86cbaefc22"
    fileprivate static let googleTimeZone = "AIzaSyAlTJ6_w_Pfy1nRatUt4qV1uj8436hMxEk"
    fileprivate static let Meetup = "4a465f213f5d8047321b627874238070"

}
//Our Request buildables will have the baseURLs and will create the URL that will eventually be sent in the request.
//So Im making these fileprivate because I dont see anyone else needing this information
struct BaseURLStrings{
    fileprivate static let openWeatherMaps = "api.openweathermap.org/data/2.5/weather?"
    fileprivate static let googleTimeZone = "https://maps.googleapis.com/maps/api/timezone/json?location="
    fileprivate static let Meetup = ""
}

//A-C will be conforming to the RequestBuildable and hold the information necessary to make network requests
//A
struct OpenWeatherMapsRequest: RequestBuildable{
    let requestType: RequestType
    let endpoint: URL?
    init(type: RequestType, city: String){
        self.requestType = type
        var endpoint: URL?
        switch type{
        case .get: endpoint = URL(string: BaseURLStrings.openWeatherMaps+"q=\(city)"+"appid=\(ApiKeys.openWeatherMaps)")
        default: fatalError("Invalid request type. Expected .get recieved \(type)")
        }
        self.endpoint = endpoint
    }
}
//B
struct GoogleTimeZoneRequest{
    let requestType: RequestType
    let endpoint: URL?
    
    init(type: RequestType, lat: String, lng: String){
        self.requestType = type
        var endpoint: URL?
        switch type{
        case .get: endpoint = URL(string: BaseURLStrings.googleTimeZone+"\(lat),"+"\(lng)&timestamp=1331161200&key=\(ApiKeys.googleTimeZone)")
        default: fatalError("Invalid request type. Expected .get recieved \(type)")
        }
        self.endpoint = endpoint
    }
}
//C
struct MeetupRequest{
}
