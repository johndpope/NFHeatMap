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
    
    var mapView : MKMapView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.mapView = MKMapView(frame: self.view.bounds);
        self.view.addSubview(self.mapView!)
        self.view.backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}
