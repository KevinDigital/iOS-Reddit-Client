//
//  NSError+Alert.swift
//  RedditClient
//
//  Created by Eric Appel on 11/10/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import UIKit

extension NSError {
    func showAlert() {
        let alert = UIAlertView(title: "Error \(self.domain) : \(self.code)", message: self.localizedDescription, delegate: nil, cancelButtonTitle: "OK")
        alert.show()
    }
}





