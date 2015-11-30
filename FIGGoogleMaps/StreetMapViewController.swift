//
//  StreetMapViewController.swift
//  FIGGoogleMaps
//
//  Created by John Figueiredo on 11/25/15.
//  Copyright © 2015 John Figueiredo. All rights reserved.
//

import UIKit
import GoogleMaps

class StreetMapViewController: UIViewController {

    @IBOutlet var panoView: GMSPanoramaView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        panoView.moveNearCoordinate(CLLocationCoordinate2DMake(50.059139, -122.958391))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension StreetMapViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            panoView.moveNearCoordinate(CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude))
            locationManager.stopUpdatingLocation()
        }
    }
}


