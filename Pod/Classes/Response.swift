//
//  Response.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation

/**
 Class Response
 
Return from the Recast API call
 */
public class Response : CustomStringConvertible
{
    public var source : String?
    public var intents : [[String : AnyObject]]?
    public var act : String?
    public var type : String?
    public var negated : Bool?
    public var sentiment : String?
    public var entities : [String : AnyObject]?
    public var language : String?
    public var version : String?
    public var timestamp : String?
    public var status : Int?
    public var raw : [String : AnyObject]
    
    /**
     Init class with JSON
     
     - parameter raw : JSON object to init with
     */
    init (json: [String : AnyObject])
    {
        let json = json["results"] as! [String : AnyObject]
        raw = json
        source = json["source"] as? String
        intents = json["intents"] as? [[String : AnyObject]]
        act = json["act"] as? String
        type = json["type"] as? String
        negated = json["negated"] as? Bool
        sentiment = json["sentiment"] as? String
        entities = json["entites"] as? [String : AnyObject]
        language = json["language"] as? String
        version = json["version"] as? String
        timestamp = json["timestamp"] as? String
        status = json["status"] as? Int
    }
    
    public var description: String {
        return raw.description
    }
    
    public func all(entity : String) -> [[String : AnyObject]]? {
        return (entities?[entity] as? [[String : AnyObject]])
    }
    
    public func get(entity : String) -> [String : AnyObject]? {
        return (entities?[entity]?[0] as? [String : AnyObject])
    }
    
    public func intent() -> [String : AnyObject]? {
        return (intents?[0])
    }
}
