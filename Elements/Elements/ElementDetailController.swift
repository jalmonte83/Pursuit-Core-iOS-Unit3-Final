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
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = element.name
        elementNumber.text = "\(element.number)"
        elementSymbol?.text = element.symbol
        elementWeight?.text = "\(element.weight)"
        elementMeltPoint.text = "\(String(describing: element.boil))"
        elementBoilPoint.text = "\(String(describing: element.melt))"
        elementDiscoveredBy?.text = element.discoveredBy
        ImageHelper.shared.fetchImage(urlString: "http://images-of-elements.com/lowercasedElementName.jpg") { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                self.elementImage.image = image
            }
        }
        
    }
    
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addToFavorites(_ sender: UIBarButtonItem) {
        // required parameters for favoriting
        // trackId, favoritedBy, collectionName, artworkUrl600
        let favorite = Favorite.init(elementSymbol: element.symbol, elementName: element.name)
        
        // encode the favorite object as Data to send to the API
        // using JSONEncoder()
        do {
            let data = try JSONEncoder().encode(favorite)
            ElementAPIClient.favoriteElement(data: data) { (appError, success) in
                if let appError = appError {
                    DispatchQueue.main.async {
                        self.showAlert(title: "Error Message", message: appError.errorMessage())
                    }
                } else if success {
                    DispatchQueue.main.async {
                        self.showAlert(title: "successfully favorited element", message: "")
                    }
                } else {
                    DispatchQueue.main.async {
                        self.showAlert(title: "was not favorited", message: "")
                    }
                }
            }
        } catch {
            print("encoding error: \(error)")
        }
    }
    
}
