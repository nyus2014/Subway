//
//  ViewController.swift
//  SubwayMap
//
//  Created by Sihang Huang on 10/29/14.
//  Copyright (c) 2014 Sihang Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    var searchBar : UISearchBar!
    var imageView : UIImageView!
    var dot : UIView!
    var center : CGPoint!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
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
        
        searchBar = UISearchBar();
        searchBar.delegate = self
        searchBar.sizeToFit()
        self.navigationItem.titleView = searchBar
        
        imageView = UIImageView(image: UIImage(named: "subwaymap"))
        self.scrollview.addSubview(imageView);
        self.scrollview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0.0-[imageView]-0.0-|", options: NSLayoutFormatOptions.fromMask(0), metrics: nil, views: ["imageView":imageView]));
        self.scrollview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0.0-[imageView]-0.0-|", options: NSLayoutFormatOptions.fromMask(0), metrics: nil, views: ["imageView":imageView]));
        
        self.scrollview.maximumZoomScale = 1.0
        self.scrollview.minimumZoomScale = 0.14
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("handleTap:")))
    }

    override func viewWillAppear(animated: Bool) {
        self.scrollview.zoomScale = 0.14
        dot = UIView(frame: CGRectMake(1188, 1430, 30, 30))
        dot.backgroundColor = UIColor.redColor()
        self.imageView.addSubview(dot);
        center = dot.center
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

    //MARK: UIScrollView Zooming
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView!) {
        
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        NSLog("%f", scale)
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
//        
//        if dot != nil {
//            let zoomScale = self.scrollview.zoomScale
//            println("scale %f", zoomScale)
//            let x = center.x
//            let y = center.y
//            println("x:%f y:%f",x, y)
//            let x1 = dot.center.x
//            let y1 = dot.center.y
//            println("x:%f y:%f",x1, y1)
//        }
    }
    
    func handleTap(gesture: UITapGestureRecognizer){
        let point : CGPoint = gesture.locationInView(imageView)
        let point1 : CGPoint = gesture.locationInView(imageView)

        let zoomScale = self.scrollview.zoomScale
        println("scale %f", zoomScale)
        println("x:%f y:%f",point.x, point.y)
        println()
    }
}

