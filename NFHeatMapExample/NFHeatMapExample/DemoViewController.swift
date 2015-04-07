//
//  DemoViewController.swift
//  NFHeatMapExample
//
//  Created by Gabor Nagy Farkas on 01/04/15.
//  Copyright (c) 2015 Gabor Nagy Farkas. All rights reserved.
//

import UIKit
import MapKit

class DemoViewController: UIViewController{
    
    var mapView : MKMapView = MKMapView()
    var locationArray : NSArray = NSArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        mapView.frame = CGRectZero
        mapView.setTranslatesAutoresizingMaskIntoConstraints(false)

        self.view.addSubview(mapView)
        
        var horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[mapView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["mapView" : mapView])
        
        var verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[mapView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["mapView" : mapView])
        
        self.view.addConstraints(horizontalConstraint)
        self.view.addConstraints(verticalConstraint)
    
        locationArray = DemoHelper.sharedInstance.generateRandomLocationArray(50)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}
