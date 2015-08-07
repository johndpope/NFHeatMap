//
//  MKMapViewDelegate.swift
//  NFHeatMapExample
//
//  Created by Gabor Nagy Farkas on 07/08/15.
//  Copyright (c) 2015 Gabor Nagy Farkas. All rights reserved.
//

import Foundation
import MapKit

class MapViewDelegate : NSObject, MKMapViewDelegate
{
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer!
    {
        if overlay is MKCircle
        {
            var circle = MKCircleRenderer(overlay: overlay)
            circle.fillColor = UIColor(red: 0.0, green: 0.0, blue: 0.7, alpha: 0.5)
            return circle
        }
        else
        {
            return nil
        }
    }
}
