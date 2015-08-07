//
//  DemoViewController.swift
//  NFHeatMapExample
//
//  Created by Gabor Nagy Farkas on 01/04/15.
//  Copyright (c) 2015 Gabor Nagy Farkas. All rights reserved.
//

import UIKit
import MapKit

class DemoViewController : UIViewController
{
    
    var mapView : MKMapView = MKMapView()
    var mapViewDelegate : MapViewDelegate = MapViewDelegate()
    var locationArray : NSArray = NSArray()
    var annotationArray : NSMutableArray = NSMutableArray()
    var optionsView : UIView = UIView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupMapView()
        self.setupOptionsView()
        self.setupConstraintsOnMainView()
        
        locationArray = DemoHelper.sharedInstance.generateRandomLocationArray(10000)
    }
    
    // MARK: -
    // MARK: Setups
    
    func setupMapView()
    {
        mapView.frame = CGRectZero
        mapView.setTranslatesAutoresizingMaskIntoConstraints(false)
        mapView.delegate = self.mapViewDelegate
        self.view.addSubview(mapView)
    }
    
    func setupOptionsView()
    {
        optionsView.frame = CGRectZero
        optionsView.backgroundColor = UIColor.whiteColor()
        optionsView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var showAnnotationLabel : UILabel = UILabel()
        showAnnotationLabel.text = "Show generated points on map"
        showAnnotationLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var showAnnotationSwitch : UISwitch = UISwitch()
        showAnnotationSwitch.setTranslatesAutoresizingMaskIntoConstraints(false)
        showAnnotationSwitch.addTarget(self, action: "switchChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        var drawOnMapButton : UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        drawOnMapButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        drawOnMapButton.backgroundColor = UIColor.redColor()
        drawOnMapButton.setTitle("Draw a circle on map!", forState: UIControlState.Normal)
        drawOnMapButton.addTarget(self, action: "buttonTapped", forControlEvents: UIControlEvents.TouchUpInside)
        
        optionsView.addSubview(showAnnotationLabel)
        optionsView.addSubview(showAnnotationSwitch)
        optionsView.addSubview(drawOnMapButton)
        
        var horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[showAnnotationLabel]-[showAnnotationSwitch]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["showAnnotationLabel" : showAnnotationLabel, "showAnnotationSwitch" : showAnnotationSwitch])
        
        var horizontalButtonConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[drawOnMap]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["drawOnMap" : drawOnMapButton])
        
        var verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[showAnnotationSwitch]-[drawOnMap]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["showAnnotationSwitch" : showAnnotationSwitch, "drawOnMap" : drawOnMapButton])
        
        var verticalLabelConstraint = NSLayoutConstraint(item: showAnnotationLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: showAnnotationSwitch, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        optionsView.addConstraints(horizontalConstraint)
        optionsView.addConstraints(horizontalButtonConstraint)
        optionsView.addConstraints(verticalConstraint)
        optionsView.addConstraint(verticalLabelConstraint)
        
        self.view.addSubview(optionsView)
    }
    
    func setupConstraintsOnMainView()
    {
        var horizontalMapViewConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[mapView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["mapView" : mapView])
        var verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[mapView]-0-[optionsView(100)]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["mapView" : mapView, "optionsView" : optionsView])
        var horizontalOptionsViewConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[optionsView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["optionsView" : optionsView])
        
        self.view.addConstraints(horizontalMapViewConstraint)
        self.view.addConstraints(horizontalOptionsViewConstraint)
        self.view.addConstraints(verticalConstraint)
    }
    
    // MARK: -
    // MARK: Annotations
    
    func showAnnotationsOnMap()
    {
        if(self.annotationArray.count == 0)
        {
            for index in 0...(self.locationArray.count - 1)
            {
                var currentAnnotation = MKPointAnnotation()
                let currentLocation = self.locationArray[index] as! NFLocationPoint
                currentAnnotation.coordinate = currentLocation.location
                self.annotationArray.addObject(currentAnnotation)
            }
        }
        
        for index in 0...(self.annotationArray.count - 1)
        {
            self.mapView.addAnnotation(self.annotationArray[index] as! MKPointAnnotation)
        }
        
        
    }
    
    func hideAnnotationsOnMap()
    {
        self.mapView.removeAnnotations(self.mapView.annotations)
    }
    
    // MARK: -
    // MARK: UIChange event handling
    
    func switchChanged(sender: UISwitch)
    {
        switch sender.on
        {
        case true:
            self.showAnnotationsOnMap()
        case false:
            self.hideAnnotationsOnMap()
        default:
            break
        }
    }
    
    func buttonTapped()
    {
        var szeged : CLLocation = CLLocation(latitude: 46.2550, longitude: 20.1450)
        self.drawCircleAtLocation(szeged)
    }
    
    // MARK: -
    // MARK: Drawing on map
    
    func drawCircleAtLocation(location: CLLocation){
        var c = MKCircle(centerCoordinate: location.coordinate, radius: 100000 as CLLocationDistance)
        self.mapView.addOverlay(c)
    }
    
    // MARK: -
    // MARK: Memory management

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
