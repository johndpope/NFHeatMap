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
    var optionsView : UIView = UIView()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupMapView()
        self.setupOptionsView()
        self.setupConstraints()
    
        locationArray = DemoHelper.sharedInstance.generateRandomLocationArray(50)
    }
    
    func setupMapView()
    {
        mapView.frame = CGRectZero
        mapView.setTranslatesAutoresizingMaskIntoConstraints(false)
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

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}
