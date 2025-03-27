//
//  LocationManager.swift
//  FindMe
//
//  Created by Ming Bian on 3/18/25.
//

import Foundation
import CoreLocation


protocol LocationManagerDelegate {
    
    func didUpdateLocation(_ location: CLLocation)
    //if location manager wants to call a delegate, need to figure out who is delegate
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    public var delegate:LocationManagerDelegate?
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
    
    //Mark: delegate methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            delegate?.didUpdateLocation(location)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("Authorization Changed: \(manager.authorizationStatus)")
        
        switch(manager.authorizationStatus) {
        case .authorizedWhenInUse:
            print("Authorized for when in use")
        
        case .authorizedAlways:
            print("Always access location in background")
        
        case .notDetermined:
            print("awaiting user response")
            
        default:
            print("Not authorized")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
}
