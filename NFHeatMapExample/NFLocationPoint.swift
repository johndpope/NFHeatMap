//
//  NFLocationPoint.swift
//  NFHeatMapExample
//
//  Created by Gabor Nagy Farkas on 02/04/15.
//  Copyright (c) 2015 Gabor Nagy Farkas. All rights reserved.
//

import UIKit
import MapKit

class NFLocationPoint: NSObject {
    
    var location : CLLocationCoordinate2D
    var locationWeight : Double = 1.0
    
    init(latitude: Double, longitude: Double)
    {
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(latitude: Double, longitude: Double, weight: Double)
    {
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        locationWeight = weight
    }
    
    init(locationCoordinate: CLLocationCoordinate2D)
    {
        location = locationCoordinate
    }
    
    init(locationCoordinate: CLLocationCoordinate2D, weight: Double)
    {
        location = locationCoordinate
        locationWeight = weight
    }
   
}
