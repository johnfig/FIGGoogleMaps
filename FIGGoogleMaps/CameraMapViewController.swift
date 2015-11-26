//
//  CameraMapViewController.swift
//  FIGGoogleMaps
//
//  Created by John Figueiredo on 11/25/15.
//  Copyright © 2015 John Figueiredo. All rights reserved.
//

import UIKit
import GoogleMaps

class CameraMapViewController: UIViewController {
  
  lazy var mapView = GMSMapView()
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    self.view = mapView
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension CameraMapViewController: CLLocationManagerDelegate {
  func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    if status == .AuthorizedWhenInUse {
      locationManager.startUpdatingLocation()
      mapView.myLocationEnabled = true
      mapView.settings.myLocationButton = true
    }
  }
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
      mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 30, viewingAngle: 40)
      locationManager.stopUpdatingLocation()
    }
  }
}
