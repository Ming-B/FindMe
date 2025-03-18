//
//  LocationManager.swift
//  FindMe
//
//  Created by Ming Bian on 3/18/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    
    static let shared = LocationManager() //singleton
    
    private override init() {
        super.init()
        self.locationManager.delegate = self
        //setting self as delegate to receive location manager notifications/requests
    }
    
    func requestPerms() {
        locationManager.requestWhenInUseAuthorization( )
        
        
    }
    
    func startUpdating() {
        //tell location manager to start updating the location
        locationManager.startUpdatingLocation( )
    }
    
}
