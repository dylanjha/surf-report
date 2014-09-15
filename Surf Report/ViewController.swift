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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchImages(tag: String!){
        let instagramURLString = "https://api.instagram.com/v1/tags/" + tag + "/media/recent?client_id=6ad531cd5fdc4b1aa78df742986bbef9"
        let manager = AFHTTPRequestOperationManager()
        manager.GET( instagramURLString,
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                if let data = responseObject.valueForKey("data") as? [AnyObject] {
                    for var i = 0; i < data.count; i++ {
                        let dataObj: AnyObject = data[i]
                        if let imageURLString = dataObj.valueForKeyPath("images.standard_resolution.url") as? String {
                            println("image " + String(i) + " URL is " + imageURLString)
                            
                            let imageView = UIImageView(frame: CGRectMake(0, CGFloat(320*i), 320, 320))
                            self.scrollView.addSubview(imageView)
                            imageView.setImageWithURL( NSURL(string: imageURLString))
                        }
                        
                    }
                }
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("JSON: " + error.localizedDescription)
            }
        )
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!){
        for subview in self.scrollView.subviews {
            subview.removeFromSuperview()
        }
        searchBar.resignFirstResponder()
        fetchImages(searchBar.text)
    }


}

