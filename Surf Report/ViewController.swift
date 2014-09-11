//
//  ViewController.swift
//  Surf Report
//
//  Created by Dylan Jhaveri on 9/10/14.
//  Copyright (c) 2014 Dylan Jhaveri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = AFHTTPRequestOperationManager()
        manager.GET("https://api.instagram.com/v1/tags/SurferPhotos/media/recent?client_id=6ad531cd5fdc4b1aa78df742986bbef9",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                if let data = responseObject.valueForKey("data") as? [AnyObject] {
                    for var i = 0; i < data.count; i++ {
                        let dataObj: AnyObject = data[i]
                        if let imageURLString = dataObj.valueForKeyPath("images.standard_resolution.url") as? String {
                            let imageData = NSData(contentsOfURL: NSURL(string: imageURLString))
                            let imageView = UIImageView(image: UIImage(data: imageData))
                            imageView.frame = CGRectMake(0, CGFloat(320*i), 320, 320)
                            self.scrollView.addSubview(imageView)
                        }
                        
                    }
                }
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

