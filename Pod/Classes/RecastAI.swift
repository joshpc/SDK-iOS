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
import SwiftWebSocket

/**
 RecastAPI class handling request to the API
 */
public class RecastAPI
{
    private let url : String = "https://api.recast.ai/request"
    private let url_voice : String = "ws://api.recast.ai/request"
    private let token : String
    private weak var delegate : HandlerRecastRequestProtocol?
    private weak var delegateVoiceFile : HandlerRecastRequestProtocol?
    var audio : AudioFile = AudioFile()
    
    /**
     Init RecastAPI Class for text
     
     - parameter token: your app token
     - parameter handlerRecastRequestProtocol: class that handles the protocol
     
     - returns: void
     */
    public init (token : String, handlerRecastRequestProtocol : HandlerRecastRequestProtocol)
    {
        self.token = token
        self.delegate = handlerRecastRequestProtocol
    }
    
    /**
     Make a request to Recast API
     
     - parameter request: sentence to send to Recast API
     
     - returns: void
     */
    public func makeRequest(request : String)
    {
        let param = ["text" : request]
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
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
                    self.delegate?.recastRequestDone(Response(JSONDecoder(response.data!)))
                }
        }
    }
 
    /**
     Start voice recording
     
     - returns: void
     */
    public func startVoiceRequest()
    {
        audio.recordAudio()
    }
    
    /**
     Stop voice recording and make the request to Recast.AI API and parse JSON response into Response object
     
     - returns: void
     */
    public func stopVoiceRequest()
    {
        audio.stopAudio()
        let headers = ["Authorization": "Token " + self.token]
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
                        self.delegate?.recastRequestDone(Response(JSONDecoder(response.data!)))
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

