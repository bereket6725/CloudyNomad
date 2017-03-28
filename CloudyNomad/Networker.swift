//
//  Networker.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/27/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire

//handles request errors
enum RequestError: Error{
    case invalidURL
    case invalidData
    case defaultRequestError
}
//handles networking for OpenWeatherMaps
struct WeatherNetworker: GetRequestable{
    static func get(builder: RequestBuildable, completion: @escaping (Result<[WeatherModel], RequestError>) -> Void) {
        requestData(builder: builder) { result in
            switch result{
            case .success(let data):  completion(.success(WeatherModel.parseJSON(data: data)))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
//handles Netowrking for GoogleTimeZone
struct GoogleTimeZoneNetworker: GetRequestable{
    static func get(builder: RequestBuildable, completion: @escaping (Result<[TimeZone], RequestError>) -> Void) {
        requestData(builder: builder) { result in
            switch result{
            case .success(let data):  completion(.success(TimeZone.parseJSON(data: data)))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
//handles Networking for Meetup 
struct MeetupNetworker: Networkable{
    static func get(builder: RequestBuildable, completion: @escaping (Result<[Event], RequestError>) -> Void) {
        requestData(builder: builder) { result in
            switch result{
            case .success(let data):  completion(.success(Event.parseJSON(data: data)))
            case .failure(let error): completion(.failure(error))
            }
        }
    }    
    static func post(builder: RequestBuildable, completion: @escaping (Result<Void, RequestError>) -> Void) {
        updateData(builder: builder){ result in
            switch result{
            case .success: completion(.success())
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
