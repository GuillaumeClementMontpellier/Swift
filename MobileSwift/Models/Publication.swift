//
//  Publication.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class Publication: Identifiable, Codable {
    
    let _id: String
    let publicationAuthor: String
    var publicationTitle: String
    var publicationDescription: String
    
    
    init(id: String, auteur: String, titre: String, contenu: String) {
        self._id = id
        self.publicationAuthor = auteur
        self.publicationTitle = titre
        self.publicationDescription = contenu
    }
    
}
