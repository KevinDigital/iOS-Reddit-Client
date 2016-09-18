//
//  DataManager.swift
//  RedditClient
//
//  Created by Lucas Derraugh on 04/11/16.
//  Copyright (c) 2016 Lucas Derraugh. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLStringConvertible {
    static let baseURLString = "http://www.reddit.com"
    case Root
    case Subreddit(String)
    
    var URLString: String {
        let path: String = {
            switch self {
            case .Root:
                return "/.json"
            case .Subreddit(let subRedditTitle):
                return "/r/\(subRedditTitle)/.json"
            }
        }()
        return Router.baseURLString + path
    }
}

class DataManager: NSObject {
    
    class var sharedInstance : DataManager {
        struct Static {
            static var instance: DataManager = DataManager()
        }
        return Static.instance
    }
    
    func getFrontPage(completion:(error: NSError?, result: [RedditItem]?) -> Void) {
        Alamofire
            .request(.GET, Router.Root)
            .responseJSON { (response) in
                if let error = response.result.error {
                    completion(error: error, result: nil)
                } else {
                    if let swiftyJSON = JSON(rawValue: response.result.value!) {
                        let children = swiftyJSON["data"]["children"].arrayValue
                        let redditArray = children.map({ (json) -> RedditItem in
                            return RedditItem(json: json)
                            })
                        //let reditArray = children.map { RedditItem(json: $0) }
                        completion(error: nil, result: redditArray)
                    }
                }
        }
    
    }
    
}
