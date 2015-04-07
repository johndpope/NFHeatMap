//
//  DemoHelper.swift
//  NFHeatMapExample
//
//  Created by Gabor Nagy Farkas on 07/04/15.
//  Copyright (c) 2015 Gabor Nagy Farkas. All rights reserved.
//

import Foundation

private let _demoHelper = DemoHelper()

class DemoHelper {
    class var sharedInstance: DemoHelper
    {
        return _demoHelper
    }
    
    func generateRandomLocationArray(count : Int) -> NSArray
    {
        var retVal : NSMutableArray = NSMutableArray()
        
        for index in 1...count
        {
            let randomCoordinate : NFLocationPoint = NFLocationPoint(latitude: self.generateRandomDouble(), longitude: self.generateRandomDouble())
            retVal.addObject(randomCoordinate)
        }
        
        return retVal
    }
    
    func generateRandomDouble() -> Double
    {
        var retVal : Double
        retVal = (Double(arc4random()) / 0x100000000) * 360.0 - 180.0
        return retVal
    }
}
