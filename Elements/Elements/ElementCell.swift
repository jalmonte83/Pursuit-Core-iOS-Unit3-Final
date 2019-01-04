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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   // private var urlString = ""
    
    //public func configureCell(element: Element) {
        
       // urlString = podcast.artworkUrl600.absoluteString
        
        //podcastCollectionName.text = podcast.collectionName
       // elementName.text = element.name
//        if let image = ImageHelper.shared.image(forKey: podcast.artworkUrl600.absoluteString as NSString) {
//            podcastImage.image = image
//        } else {
//            //activityIndicator.startAnimating()
//            ImageHelper.shared.fetchImage(urlString: podcast.artworkUrl600.absoluteString) { (appError, image) in
//                if let appError = appError {
//                    print(appError.errorMessage())
//                } else if let image = image {
//                    if self.urlString == podcast.artworkUrl600.absoluteString {
//                        self.podcastImage.image = image
//                    }
//                }
//                self.activityIndicator.stopAnimating()
//            }
//        }
  //  }
}

