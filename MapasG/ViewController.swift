//
//  ViewController.swift
//  Mapas
//
//  Created by Invitado  on 10/26/19.
//  Copyright © 2019 Zeltzin hernandez_ Gustavo Moreno. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class ViewController: UIViewController {
    
    //-----------------------------------------
    var direccion: [Direcciones] = []
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    
    //-------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location Cu fac ingenieria

        let initialLocation = CLLocation(latitude: 19.3272501, longitude: -99.1825469)
        
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        
        mapView.register(DireccionesView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) //le da la forma e imagen de anotacion
        loadInitialData()
        mapView.addAnnotations(direccion)
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    // --------------------------
    
    let locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestAlwaysAuthorization()
        }
        //    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
        //      mapView.showsUserLocation = true
        //    } else {
        //      locationManager.requestWhenInUseAuthorization()
        //    }
    }
    
    // ------------------------------------
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func loadInitialData() {
        // 1
        guard let fileName = Bundle.main.path(forResource: "Direcciones", ofType: "json")
            else { return }
        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
        
        guard
            let data = optionalData,
            // 2
            let json = try? JSONSerialization.jsonObject(with: data),
            // 3
            let dictionary = json as? [String: Any],
            // 4
            let works = dictionary["data"] as? [[Any]]
            else { return }
        // 5
        let validWorks = works.compactMap {Direcciones(json: $0) }
        direccion.append(contentsOf: validWorks)
    }
    
}

// MARK: - MKMapViewDelegate

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Direcciones
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:
            MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
}




