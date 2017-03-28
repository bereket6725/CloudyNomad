//
//  RequestBuilder.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire


//Our result enum is generic because the success case may return a String, a WeatherModel Object or an EventModel Object
//So we should make it Reusable
enum Result <T, E:Error>{
    case success(T)
    case failure(E)
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
        case .get: endpoint = URL(string: BaseURLStrings.openWeatherMaps+"q=\(city)"+"appid=\(apiKeys.openWeatherMaps)")
        default: fatalError("Invalid request type. Expected .get recieved \(type)")
        }
        self.endpoint = endpoint
    }
}
//B
struct GoogleTimeZoneRequest{
}
//C
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

struct apiKeys{
    fileprivate static let openWeatherMaps = "26db8fa456dbb4ac68876d86cbaefc22"
    fileprivate static let googleTimeZone = ""
    fileprivate static let Meetup = ""

}
//Our Request buildables will have the baseURLs and will create the URL that will eventually be sent in the request.
//So Im making these fileprivate because I dont see anyone else needing this information
struct BaseURLStrings{
    fileprivate static let openWeatherMaps = "api.openweathermap.org/data/2.5/weather?"
    fileprivate static let googleTimeZone = ""
    fileprivate static let Meetup = ""
}

