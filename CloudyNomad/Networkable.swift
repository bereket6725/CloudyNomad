//
//  Networkable.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire


protocol GetRequestable{
    associatedtype P: Parsable
    static func get(builder: RequestBuildable, completion: @escaping(Result<[P], RequestError>) -> Void)
}

protocol PostRequestable{
    static func post(builder: RequestBuildable, completion: @escaping(Result<Void, RequestError>) -> Void)
}


extension GetRequestable{
    static func requestData(builder: RequestBuildable, completion: @escaping (Result<Data, RequestError>) -> Void){
        guard let url = builder.endpoint else { completion(.failure(.invalidURL)); return }
        let type = builder.requestType
        
        switch type{
        case .get:
            Alamofire.request(url).responseJSON{ response in
                guard let rawData = response.data else {completion(.failure(.invalidData)); return }
                completion(.success(rawData))
            }
        default:
            fatalError("invalid request type: \(type). Expected .get")
        }
    }
}

extension PostRequestable{
    static func updateData(builder: RequestBuildable, completion: @escaping(Result<Void, RequestError>) -> Void){
        guard let url = builder.endpoint else { completion(.failure(.invalidURL)); return }
        var params : [String: Any]?
        
        switch builder.requestType{
        case .post(let parameters): params = parameters
        default: fatalError("invalid Request type: \(builder.requestType) expected .post")
        }
        Alamofire.request(url, method: builder.requestType.methodType, parameters: params).responseJSON{ response in
            if response.response?.statusCode == 201 {
                completion(.success())
            }
            else{
                completion(.failure(.defaultRequestError))
            }
        }
    }
}


protocol Networkable: GetRequestable, PostRequestable{
//    associatedtype P: Parsable
//    static func get(builder: RequestBuildable, completion: @escaping(Result<[P], RequestError>) -> Void)
//    static func post(builder: RequestBuildable, completion: @escaping(Result<Void, RequestError>) -> Void)
}


extension Networkable{
//    static func requestData(builder: RequestBuildable, completion: @escaping (Result<Data, RequestError>) -> Void){
//        guard let url = builder.endpoint else { completion(.failure(.invalidURL)); return }
//        let type = builder.requestType
//        
//        switch type{
//        case .get:
//            Alamofire.request(url).responseJSON{ response in
//                guard let rawData = response.data else {completion(.failure(.invalidData)); return }
//                completion(.success(rawData))
//            }
//        default:
//            fatalError("invalid request type: \(type). Expected .get")
//        }
//    }
//    
//    static func updateData(builder: RequestBuildable, completion: @escaping(Result<Void, RequestError>) -> Void){
//        guard let url = builder.endpoint else { completion(.failure(.invalidURL)); return }
//        var params : [String: Any]?
//        
//        switch builder.requestType{
//        case .post(let parameters): params = parameters
//        default: fatalError("invalid Request type: \(builder.requestType) expected .post")
//        }
//        Alamofire.request(url, method: builder.requestType.methodType, parameters: params).responseJSON{ response in
//            if response.response?.statusCode == 201 {
//                completion(.success())
//            }
//            else{
//                completion(.failure(.defaultRequestError))
//            }
//        }
//    }
}
