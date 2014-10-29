//
//  ViewController.swift
//  SubwayMap
//
//  Created by Sihang Huang on 10/29/14.
//  Copyright (c) 2014 Sihang Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate {

    //for ios 8 UISearchController
    var searchController : UISearchController!
    var searchResultController : UITableViewController!
    //for ios 7 and below, UISearchDisplayController
    var searchAndDisplayController : UISearchDisplayController!
    
    func isIOS8() -> Bool {
        
        let systemVersion = (UIDevice.currentDevice().systemVersion as NSString).doubleValue
        if systemVersion >= 8 {
            return true;
        } else {
            return false;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchResultController = UITableViewController()
        
        if isIOS8() {
            searchController = UISearchController(searchResultsController: searchResultController)
            searchController.searchResultsUpdater = self
            searchController.dimsBackgroundDuringPresentation = false
            
            searchController.searchBar.sizeToFit()
            searchController.searchBar.delegate = self
            searchController.searchBar.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            self.view.addSubview(searchController.searchBar)
            
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0.0-[searchBar]-0.0-|",
                options: NSLayoutFormatOptions.fromMask(0),
                metrics: nil,
                views: ["searchBar":searchController.searchBar]))
            
            self.view.addConstraint(NSLayoutConstraint(
                item: searchController.searchBar,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.topLayoutGuide,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: 0.0))
        } else {
            let searchBar = UISearchBar();
            searchBar.delegate = self
            searchAndDisplayController = UISearchDisplayController(searchBar: searchBar, contentsController: searchResultController)
            searchBar.sizeToFit()
            
            searchAndDisplayController.delegate = self
            searchAndDisplayController.searchResultsDataSource = self
            searchAndDisplayController.searchResultsDelegate = self
            
        }
        
        
        
//        var tableView = UITableView();
//        tableView.setTranslatesAutoresizingMaskIntoConstraints(false);
//        self.view.addSubview(tableView);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
    }
    
    //MARK: UITableView Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

