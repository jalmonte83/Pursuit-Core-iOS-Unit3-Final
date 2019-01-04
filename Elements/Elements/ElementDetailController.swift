//
//  ElementDetailController.swift
//  Elements
//
//  Created by Jeffrey Almonte on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementDetailController: UIViewController {
    var element: ElementInfo!
    @IBOutlet weak var elementNumber: UILabel!
    @IBOutlet weak var elementSymbol: UILabel!
    @IBOutlet weak var elementWeight: UILabel!
    @IBOutlet weak var elementMeltPoint: UILabel!
    @IBOutlet weak var elementBoilPoint: UILabel!
    @IBOutlet weak var elementDiscoveredBy: UILabel!
    @IBOutlet weak var elementImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = element.name
        elementNumber.text = "\(element.number)"
        elementSymbol?.text = element.symbol
        elementWeight?.text = "\(element.weight)"
        elementMeltPoint.text = "\(String(describing: element.boil))"
        elementBoilPoint.text = "\(String(describing: element.melt))"
        elementDiscoveredBy?.text = element.discoveredBy
        //        elementImage
        //
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
