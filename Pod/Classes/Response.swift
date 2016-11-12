//
//  Response.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import JSONJoy

/**
 Class Response
 
Return from the Recast API call
 */
open class Response
{
    open var source : String?
    open var intents : [String]?
    open var sentences : [Sentence]?
    open var language : String?
    open var version : String?
    open var timestamp : String?
    open var status : Int?
    open var raw : [String : AnyObject]?
    
    /**
     Init
     
     Init class with JSONDecoder to parse JSON
     */
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
        self.language = decoder["language"].string
        self.version = decoder["version"].string
        self.timestamp = decoder["timestamp"].string
        self.status = decoder["status"].integer
    }
}
