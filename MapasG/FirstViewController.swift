//
//  FirstViewController.swift
//  MapasG
//
//  Created by 2020-1 on 11/13/19.
//  Copyright © 2019 JM. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablita: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return direccion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! ControladorDeCelda
        
        cell.etiqueta.text = direccion[indexPath.row].title
        cell.foto.image = UIImage(named: direccion[indexPath.row].foto)
        cell.pin.image = UIImage(named: direccion[indexPath.row].icono)
        cell.backgroundColor = .clear
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    var direccion: [Direcciones] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(patternImage: UIImage(named: "fondo")!)
        tablita.backgroundColor = .clear
        
         loadInitialData()
       
        
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
