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
        mapView = MKMapView(frame: self.view.bounds);
        self.view.addSubview(self.mapView!)
        let centerLocation : NFLocationPoint = NFLocationPoint(latitude: 46.255, longitude: 20.1450)
        
        var regionToShow : MKCoordinateRegion = MKCoordinateRegionMake(centerLocation.location, MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView?.setRegion(regionToShow, animated: true)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}
