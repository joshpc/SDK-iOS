//
//  ViewController.swift
//  RecastAI
//
//  Created by plieb on 03/29/2016.
//  Copyright (c) 2016 plieb. All rights reserved.
//

import UIKit
import RecastAI

/**
Class ViewController Example of implementations for Text & Voice Requests
 */
class ViewController: UIViewController, HandlerRecastRequestProtocol
{
    //Outlets
    @IBOutlet weak var requestTextField: UITextField!
    
    //Vars
    var app : RecastAPI?
    var recording : Bool = true

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.app = RecastAPI(token : "e50e831bcc97f3b2e42b3704c55d5ce1", handlerRecastRequestProtocol: self)
    }
    
    /**
     Method called when the request was successful
     
     - parameter response: the response returned from the Recast API
     
     - returns: void
     */
    func recastRequestDone(response : Response)
    {
        print(response.source)
    }
    
    /**
     Method called when the request failed
     
     - parameter error: error returned from the Recast API
     
     - returns: void
     */
    func recastRequestError(error : NSError)
    {
        print("Delegate Error : \(error)")
    }
    
    /**
     Make text request to Recast.AI API
     */
    @IBAction func makeRequest()
    {
        if (!(self.requestTextField.text?.isEmpty)!)
        {
            //Call makeRequest with string parameter to make a text request
            self.app?.makeRequest(self.requestTextField.text!)
        }
    }
    
    /**
     Make Voice request to Recast.AI API
     */
    @IBAction func makeVoiceRequest()
    {
        if (self.recording)
        {
            self.recording = !self.recording
            //Call startVoiceRequest to start recording your voice
            self.app!.startVoiceRequest()
        }
        else
        {
            self.recording = !self.recording
            //Call stopVoiceRequest to stop recording your voice and launch the request to the Recast.AI API
            self.app!.stopVoiceRequest()
        }
    }
}
