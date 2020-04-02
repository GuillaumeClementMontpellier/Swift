//
//  Publication.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class Publication: Identifiable, Codable {
    
    let id = UUID()
    let publicationAuthor = UUID()
    var publicationTitle: String
    var publicationDescription: String
    
    
    init(titre: String, contenu: String) {
        self.publicationTitle = titre
        self.publicationDescription = contenu
    }
    
}
