//
//  ViewController.swift
//  Surf Report
//
//  Created by Dylan Jhaveri on 9/10/14.
//  Copyright (c) 2014 Dylan Jhaveri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = AFHTTPRequestOperationManager()
        manager.GET("https://api.instagram.com/v1/tags/SurferPhotos/media/recent?client_id=6ad531cd5fdc4b1aa78df742986bbef9",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                println("JSON: " + responseObject.description)
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("JSON: " + error.localizedDescription)
            }
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

