//
//  ViewModel.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/28/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

//Our result enum is generic because the success case may return a String, a WeatherModel Object or an EventModel Object
//So we should make it Reusable
enum Result <T, E:Error>{
    case success(T)
    case failure(E)
}

class ViewModel{
    
    
}
