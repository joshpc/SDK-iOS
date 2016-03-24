//
//  Location.swift
//  Pods
//
//  Created by Pierre-edouard LIEB on 24/03/2016.
//
//

import Foundation
import JSONJoy

class Location
{
    var formated : String?
    var lat : Double?
    var lng : Double?
    var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.formated = decoder["formated"].string
        self.lat = decoder["lat"].double
        self.lng = decoder["lng"].double
        self.raw = decoder["raw"].string
    }
}