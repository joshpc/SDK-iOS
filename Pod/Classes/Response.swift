//
//  Response.swift
//  Pods
//
//  Created by Pierre-edouard LIEB on 24/03/2016.
//
//

import Foundation
import JSONJoy

public class Response
{
    var source : String?
    var intents : [String]?
    var sentences : [Sentence]?
    var version : String?
    var timestamp : Int?
    var status : Int?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.source = decoder["source"].string
        if let intnts = decoder["intents"].array
        {
            self.intents = [String]()
            for intntsDecoder in intnts
            {
                self.intents?.append(intntsDecoder.string!)
            }
        }
        if let sntncs = decoder["sentences"].array
        {
            self.sentences = [Sentence]()
            for sntncsDecoder in sntncs
            {
                self.sentences?.append(Sentence(sntncsDecoder))
            }
        }
        self.version = decoder["version"].string
        self.timestamp = decoder["timestamp"].integer
        self.status = decoder["status"].integer
    }
}