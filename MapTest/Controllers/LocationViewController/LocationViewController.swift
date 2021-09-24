//
//  LocationViewController.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit
import GoogleMaps
import CoreLocation


class LocationViewController: UIViewController,ViewSpecificController {
    
    // MARK: - RootView
    typealias RootView = LocationRootView
    
    // MARK: - Services
    let locationManager = CLLocationManager()
    
    override func loadView() {
        super.loadView()
        self.view = LocationRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appearanceSettings()
        self.mapSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension LocationViewController:LocationViewIxResponder {
    
    private func appearanceSettings() {
        self.view().ixResponder = self
    }
    
    private func mapSettings() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        view().mapView.delegate = self
        view().mapView.isMyLocationEnabled = true
        view().mapView.settings.myLocationButton = true
        view().mapView.settings.compassButton = true
        view().mapView.layer.shadowOpacity = 0
        self.locationManager.startUpdatingLocation()
        self.locationManager.delegate = self
    }
    
    func primaryButtonAction() {
        
    }
    
    func searchViewTapped() {
        let controller = LocationSearchViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension LocationViewController: GMSMapViewDelegate,CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        self.view().mapView?.animate(to: camera)
        self.locationManager.stopUpdatingLocation()
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        GMSGeocoder().reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: position.target.latitude, longitude: position.target.longitude)) { (reverseResponse, error) in
            let address = reverseResponse?.results()
            print(address)
        }
    }
    
    
}
