//
//  LocationModel.swift
//  FindMe
//
//  Created by Ming Bian on 3/18/25.
//

import Foundation
import CoreLocation

@Observable
class LocationModel: LocationManagerDelegate {
    var locations = [CLLocation]()
    
    func didUpdateLocation(_ location: CLLocation) {
        self.locations.append(location)
        print("\(location)")
    }
    
    
}
