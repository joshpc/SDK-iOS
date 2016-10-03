//
//  RecastAPI.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import Alamofire

/**
RecastAIClient class handling request to the API
 */
public class RecastAIClient
{
    static fileprivate let url : String = "https://api.recast.ai/v2/request"
    static fileprivate let url_voice : String = "ws://api.recast.ai/v2/request"
    fileprivate var token : String
    fileprivate let language : String?
    
    /**
     Init RecastAIClient Class
     
     - parameter token: your bot token
     - parameter language: language of sentenses if needed
     
     - returns: RecastAIClient
     */
    public init (token : String, language : String? = nil)
    {
        self.token = token
        self.language = language
    }
    
    /**
     Make a text request to Recast API
     
     - parameter request: sentence to send to Recast API
     - parameter lang: lang of the sentence if needed
     - parameter successHandler: closure called when request succeed
     - parameter failureHandler: closure called when request failed
     
     - returns: void
     */
    public func textRequest(_ request : String, token : String? = nil, lang: String? = nil, successHandler: @escaping (Response) -> Void, failureHandle: @escaping (Error) -> Void)
    {
        if let tkn = token
        {
            self.token = token!
        }
        let headers = ["Authorization" : "Token " + self.token]
        var param = ["text" : request]
        if let ln = lang
        {
            param["language"] = ln
        }
        else if let ln = self.language
        {
            param["language"] = ln
        }
        Alamofire.request(RecastAIClient.url, method: .post, parameters: param, headers: headers).responseJSON {
            response in
            switch response.result {
                case .success(let value):
                    let recastResponse = Response(json: value as! [String : AnyObject])
                    successHandler(recastResponse)
                case .failure(let error):
                    failureHandle(error)
            }
        }
    }
    
    /**
     Make a voice request to Recast API
     
     - parameter audioFileURL: audio file URL to send to RecastAI
     - parameter lang: lang of the sentence if needed
     - parameter successHandler: closure called when request succeed
     - parameter failureHandler: closure called when request failed
     
     - returns: void
     */
    public func fileRequest(_ audioFileURL: URL, token : String? = nil, lang: String? = nil, successHandler: @escaping (Response) -> Void, failureHandle: @escaping (Error) -> Void) {
        if let tkn = token
        {
            self.token = token!
        }
        let headers = ["Authorization": "Token " + self.token]
        Alamofire.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(audioFileURL, withName: "voice")
        },
        to: RecastAIClient.url,
        method: .post,
        headers: headers,
        encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let recastResponse = Response(json: value as! [String : AnyObject])
                        successHandler(recastResponse)
                    case .failure(let error):
                        failureHandle(error)
                    }
                }
            case .failure(let encodingError):
                        failureHandle(encodingError)
            }
        })
    }
}

