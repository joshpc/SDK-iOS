//
//  ViewController.swift
//  RecastAI
//
//  Created by plieb on 03/29/2016.
//  Copyright (c) 2016 plieb. All rights reserved.
//

import UIKit
import RecastAI

class ViewController: UIViewController, HandlerRecastRequestProtocol
{
    //Outlets
    @IBOutlet weak var requestTextField: UITextField!
    
    //Vars
    var app : RecastAPI?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.app = RecastAPI(token : "e50e831bcc97f3b2e42b3704c55d5ce1", handlerRecastRequestProtocol: self)
    }
    
    func recastRequestDone(response : Response)
    {
        print(response.source)
    }
    
    func recastRequestError(error : NSError)
    {
        print(error)
    }
    
    @IBAction func makeRequest()
    {
        if (self.requestTextField.text != nil)
        {
            self.app?.makeRequest(self.requestTextField.text!)
        }
    }
}
