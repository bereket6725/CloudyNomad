//
//  Networkable.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire

protocol Networkable{
    associatedtype P: Parsable
    static func get(builder: RequestBuildable, completion: @escaping(Result<[P], RequestError>) -> Void)
    static func post(builder: RequestBuildable, completion: @escaping(Result<Void, RequestError>) -> Void)
}

extension Networkable{
    static func requestData(builder: RequestBuildable, completion: @escaping (Result<Data, RequestError>) -> Void){
    }
}
