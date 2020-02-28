//
//  Publication.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class Publication: Identifiable{
    var titre: String
    var contenu: String
    var note: Int
    
    init(titre: String, contenu: String, note: Int) {
        self.titre = titre
        self.contenu = contenu
        self.note = note
    }
}
