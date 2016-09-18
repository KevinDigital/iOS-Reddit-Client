//
//  WebViewController.swift
//  RedditClient
//
//  Created by Eric Appel on 11/10/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var url: NSURL!

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = url.absoluteString
        
        let webView = UIWebView(frame: view.frame)
        webView.scalesPageToFit = true
        view.addSubview(webView)
        
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
}
