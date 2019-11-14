//
//  ControladorDeCelda.swift
//  MapasG
//
//  Created by 2020-1 on 11/13/19.
//  Copyright © 2019 JM. All rights reserved.
//

import UIKit

class ControladorDeCelda: UITableViewCell {
    
    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var pin: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
