//
//  Discussion.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class Discussion: Identifiable{
    var titre: String
    var contenu: String
    var note: Int
    var author : String
    
    init(titre: String, contenu: String, note: Int, auth: String) {
        self.titre = titre
        self.contenu = contenu
        self.note = note
        self.author = auth
    }
}
