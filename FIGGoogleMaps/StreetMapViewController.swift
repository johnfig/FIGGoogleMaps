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

    override func viewDidLoad() {
        super.viewDidLoad()

        let panoramaNear = CLLocationCoordinate2DMake(50.059139, -122.958391)
      
        let panoView = GMSPanoramaView.panoramaWithFrame(CGRectZero,
        nearCoordinate:panoramaNear)
      
        self.view = panoView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
