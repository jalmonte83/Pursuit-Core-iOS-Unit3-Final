//
//  FavoriteElement.swift
//  Elements
//
//  Created by Jeffrey Almonte on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Favorite: Codable {
    let trackId: Int
    let favoritedBy: String
    let collectionName: String
    //let artworkUrl600: URL
}
