//
//  FeedViewController.swift
//  RedditClient
//
//  Created by Lucas Derraugh on 04/11/16.
//  Copyright (c) 2016 Lucas Derraugh. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var redditItems: [RedditItem] = []
    @IBOutlet var collectionView: UICollectionView!
    
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        flow.minimumInteritemSpacing = 1
        flow.minimumLineSpacing = 1
        flow.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 100.0)
        return flow
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.setCollectionViewLayout(flowLayout, animated: false)
        
        DataManager.sharedInstance.getFrontPage { (error, result) -> Void in
            if error != nil {
                print(error)
                error!.showAlert()
            } else {
                
                self.redditItems = result!
                self.collectionView.reloadData()
            }
        }
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return redditItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! FeedCell
        
        cell.setItem(redditItems[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let webVC = WebViewController()
        webVC.url = redditItems[indexPath.row].linkURL
        navigationController?.pushViewController(webVC, animated: true)
    }
    
    
    
    
    
    
    
    
    
}
