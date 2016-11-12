//
//  RecastAPI.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import JSONJoy
import Alamofire

/**
 RecastAIClient class handling request to the API
 */
open class RecastAIClient
{
    private let url : String = "https://api.recast.ai/v1/request"
    private let url_voice : String = "ws://api.recast.ai/v1/request"
    private let token : String
    private let language : String?
    private weak var delegate : HandlerRecastRequestProtocol?
    private weak var delegateVoiceFile : HandlerRecastRequestProtocol?
    var audio : AudioFile = AudioFile()
    
    /**
     Init RecastAPI Class for text
     
     - parameter token: your bot token
     - parameter handlerRecastRequestProtocol: class that handles the protocol
     
     - returns: void
     */
    public init (token : String, handlerRecastRequestProtocol : HandlerRecastRequestProtocol, language : String? = nil)
    {
        self.token = token
        self.delegate = handlerRecastRequestProtocol
        self.language = language
    }
    
    /**
     Make a request to Recast API
     
     - parameter request: sentence to send to Recast API
     
     - returns: void
     */
    open func textRequest(_ request : String, lang: String? = nil)
    {
        var param = ["text" : request]
        if let ln = lang
        {
            param = ["text" : request, "language" : lang!]
        }
        else if let ln = self.language
        {
            param = ["text" : request, "language" : self.language!]
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(.POST, self.url, parameters: param, headers: ["Authorization" : "Token " + self.token])
            .response { _, _, _, error in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                if let error = error {
                    dispatch_async(dispatch_get_main_queue())
                    {
                        debugPrint("\(error)")
                        self.delegate?.recastRequestError(error)
                    }
                }
        }
            .responseJSON { response in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                dispatch_async(dispatch_get_main_queue())
                {
                    let res = Results(JSONDecoder(response.data!))
                    let json = try! NSJSONSerialization.JSONObjectWithData(response.data!,  options:NSJSONReadingOptions.MutableContainers) as! [String : AnyObject]
                    res.results?.raw = json["results"] as? [String : AnyObject]
                    self.delegate?.recastRequestDone(res.results!)
                }
        }
    }
 
    /**
     Start voice recording
     
     - returns: void
     */
    open func startStreamRequest()
    {
        audio.recordAudio()
    }
    
    /**
     Stop voice recording and make the request to Recast.AI API and parse JSON response into Response object
     
     - returns: void
     */
    open func stopStreamRequest()
    {
        audio.stopAudio()
        let headers = ["Authorization": "Token " + self.token]
        let parameters : [String : String]
        if let ln = self.language
        {
            parameters = ["language" : self.language!]
        }
        Alamofire.upload(
            .POST,
            self.url,
            headers: headers,
            multipartFormData: { multipartFormData in
                multipartFormData.appendBodyPart(fileURL: self.audio.path, name: "voice")
            },
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                        let res = Results(JSONDecoder(response.data!))
                        self.delegate?.recastRequestDone(res.results!)
                    }
                case .Failure(let encodingError):
                    print(encodingError)
                    let er = encodingError as NSError
                    self.delegate?.recastRequestError(er)
                }
            }
        )
    }
}

