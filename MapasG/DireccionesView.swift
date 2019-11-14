
//  DireccionesView.swift
//  Mapas
//
//  Created by Invitado  on 10/26/19.
//  Copyright © 2019 Zeltzin hernandez_ Gustavo Moreno. All rights reserved.
//

import Foundation
import MapKit

class DireccioneskMarkerView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let direccion = newValue as? Direcciones else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            
            //      glyphText = String(artwork.discipline.first!)
            if let imageName = direccion.imageName {
                glyphImage = UIImage(named: imageName)
            } else {
                glyphImage = nil
            }
        }
    }
    
}

class DireccionesView: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let direccion = newValue as? Direcciones else {return}
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                    size: CGSize(width: 30, height: 30)))
            mapsButton.setBackgroundImage(UIImage(named: "pin"), for: UIControl.State())
            rightCalloutAccessoryView = mapsButton
            
            
            if let imageName = direccion.imageName {
                image = UIImage(named: imageName)
            } else {
                image = nil
            }
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = direccion.subtitle
            detailCalloutAccessoryView = detailLabel
        }
    }
    
}



