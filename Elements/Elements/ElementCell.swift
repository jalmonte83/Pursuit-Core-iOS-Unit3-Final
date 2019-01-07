//
//  ElementCell.swift
//  Elements
//
//  Created by Jeffrey Almonte on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {

    @IBOutlet weak var elementThumbNailIamge: UIImageView!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementSymbolWeight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
   
}

