//
//  MapVC.swift
//  AppLab
//
//  Created by Zakaria on 5/9/15.
//  Copyright (c) 2015 Zakaria. All rights reserved.
//

import UIKit
import MapKit

enum MapType: Int {
    case Standard = 0
    case Hybrid
    case Satellite
}

class MapVC : UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
    
    @IBAction func mapTypeChanged(sender: AnyObject) {
        
        if let mapType = MapType(rawValue: mapTypeSegmentedControl.selectedSegmentIndex) {
            switch(mapType){
            case .Standard:
                mapView.mapType = MKMapType.Standard
            case .Hybrid:
                mapView.mapType = MKMapType.Hybrid
            case .Satellite:
                mapView.mapType = MKMapType.Satellite
            default:
                mapView.mapType = MKMapType.Standard
            }
        }
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    var locationManager = CLLocationManager()
    
    func checkLocationAuthorizationStatus(){
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
           handleAuthorizationStatusWhenInUse()
        }else if authorizationStatus == .Denied {
            handleAuthorizationStatusDenied()
        }else if authorizationStatus == .NotDetermined{
            handleAuthorizationStatusNotDetermined()
        }
    }
    
    func handleAuthorizationStatusWhenInUse(){
        println("AuthorizedWhenInUse")
        mapView.showsUserLocation = true
    }
    
    func handleAuthorizationStatusDenied(){
        let alertController = UIAlertController(title: "Default Style", message: "Standard Alert", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel){ (action) in
            println("Canceled")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default){ (action) in
            println("OK")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func handleAuthorizationStatusNotDetermined(){
        println("Requesting Authorization for WhenInUse ")
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        println("Checking ")
    }
    
    
    
}
