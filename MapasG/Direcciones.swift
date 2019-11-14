//
//  Direcciones.swift
//  Mapas
//
//  Created by Invitado  on 10/26/19.
//  Copyright © 2019 Zeltzin hernandez_ Gustavo Moreno. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Direcciones: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let foto : String
    let icono : String
    let coordinate: CLLocationCoordinate2D
    
    
    
    init(title: String, locationName: String, foto: String, icono: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.foto = foto
        self.icono = icono
        self.coordinate = coordinate
        
        super.init()
    }
    var subtitle: String? {
        return locationName
    }
    
    //MARK: -init
    init?(json: [Any]) {
        // 1
        if let title = json[4] as? String {
            self.title = title
            print(json[4])
        } else {
            self.title = "No Title"
        }
        
        self.locationName = json[1] as! String
        self.foto = json[2] as! String
        self.icono = json[3] as! String
        
        if let latitude = Double(json[5] as! String),
            let longitude = Double(json[6] as! String) {
            self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
            self.coordinate = CLLocationCoordinate2D()
        }
    }
    
    var imageName: String? {
        if icono == "pinPeriban" { return "pinPeriban" }
        else if icono == "pinAcademico" {return "pinAcademico"}
        else if icono == "pinPsicologia" {return "pinPsicologia"}
        else if icono == "pinMedicina" {return "pinMedicina"}
        else if icono == "pinCafeteriaCiencias" {return "pinCafeteriaCiencias"}
        else if icono == "pinMuca" {return "pinMuca"}
        else if icono == "pinBiCentral" {return "pinBiCentral"}
        else if icono == "pinUniversum" {return "pinUniversum"}
        else if icono == "pinNike" {return "pinNike"}
        else if icono == "pinCibarium" {return "pinCibarium"}
        else if icono == "pinBaristas" {return "pinBaristas"}
        else if icono == "pinAuditorioCaso" {return "pinAuditorioCaso"}
        else if icono == "pinPorrua" {return "pinPorrua"}
        else if icono == "pinPolitics" {return "pinPolitics"}
        else if icono == "pinAuditorioMarshall" {return "pinAuditorioMarshall"}
        else if icono == "pinCafex" {return "pinCafex"}
        else if icono == "pinInge" {return "pinInge"}
          else if icono == "pinBarrosS" {return "pinBarrosS"}
             else if icono == "pinTaquis" {return "pinTaquis"}

        return "pin"
    }
    
    //MARK: -func mapItem
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
    
}


