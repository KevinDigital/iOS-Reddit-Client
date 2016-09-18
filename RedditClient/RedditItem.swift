//
//  RedditItem.swift
//  RedditClient
//
//  Created by Eric Appel on 11/10/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import UIKit

class RedditItem {
    let title: String
    let author: String
    let subreddit: String
    let linkURL: NSURL
    let thumbnailURL: NSURL
    var thumbnailImage: UIImage?
    let numComments: Int
    let score: Int
    
    init(json: JSON) {
        let postData = json["data"]
        
        self.title = postData["title"].stringValue
        self.author = postData["author"].stringValue
        let linkURL = NSURL(string: postData["url"].stringValue)!
        self.linkURL = linkURL
        let thumbnailURL = NSURL(string: postData["thumbnail"].stringValue)!
        self.thumbnailURL = thumbnailURL
        self.numComments = postData["num_comments"].intValue
        self.score = postData["score"].intValue
        self.subreddit = postData["subreddit"].stringValue
    }
    
}