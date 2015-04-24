//
//  DemoViewController.swift
//  NFHeatMapExample
//
//  Created by Gabor Nagy Farkas on 01/04/15.
//  Copyright (c) 2015 Gabor Nagy Farkas. All rights reserved.
//

import UIKit
import MapKit

class DemoViewController: UIViewController, MKMapViewDelegate
{
    
    var mapView : MKMapView = MKMapView()
    var locationArray : NSArray = NSArray()
    var annotationArray : NSMutableArray = NSMutableArray()
    var optionsView : UIView = UIView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupMapView()
        self.setupOptionsView()
        self.setupConstraints()
        
        locationArray = DemoHelper.sharedInstance.generateRandomLocationArray(10000)
    }
    
    func setupMapView()
    {
        mapView.frame = CGRectZero
        mapView.setTranslatesAutoresizingMaskIntoConstraints(false)
        mapView.delegate = self
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
        
        optionsView.addSubview(showAnnotationLabel)
        optionsView.addSubview(showAnnotationSwitch)
        
        var horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[showAnnotationLabel]-[showAnnotationSwitch]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["showAnnotationLabel" : showAnnotationLabel, "showAnnotationSwitch" : showAnnotationSwitch])
        
        var verticalSwitchConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[showAnnotationSwitch]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["showAnnotationSwitch" : showAnnotationSwitch])
        
        var verticalLabelConstraint = NSLayoutConstraint(item: showAnnotationLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: showAnnotationSwitch, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        optionsView.addConstraints(horizontalConstraint)
        optionsView.addConstraints(verticalSwitchConstraint)
        optionsView.addConstraint(verticalLabelConstraint)
        
        self.view.addSubview(optionsView)
    }
    
    func setupConstraints()
    {
        var horizontalMapViewConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[mapView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["mapView" : mapView])
        var verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[mapView]-0-[optionsView(100)]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["mapView" : mapView, "optionsView" : optionsView])
        var horizontalOptionsViewConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[optionsView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["optionsView" : optionsView])
        
        self.view.addConstraints(horizontalMapViewConstraint)
        self.view.addConstraints(horizontalOptionsViewConstraint)
        self.view.addConstraints(verticalConstraint)
    }
    
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
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
