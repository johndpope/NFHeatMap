//
//  NFLocationPoint.swift
//  NFHeatMapExample
//
//  Created by Gabor Nagy Farkas on 02/04/15.
//  Copyright (c) 2015 Gabor Nagy Farkas. All rights reserved.
//

import UIKit
import MapKit

class NFLocationPoint: NSObject, Printable, DebugPrintable {
    
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
    
    func euclideanDistanceTo(locationPoint : NFLocationPoint) -> Double
    {
        var retVal : Double = 0.0
        retVal = sqrt(pow((self.location.latitude - locationPoint.location.latitude), 2) + pow((self.location.longitude - locationPoint.location.longitude), 2))
        return retVal
    }
    
    override var description : String
    {
        return NSString(format: "Latitude:%.10f Longitude:%.10f Weight: %f", location.latitude, location.longitude, locationWeight) as String
    }
}
