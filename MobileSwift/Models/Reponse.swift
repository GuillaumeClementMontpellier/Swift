//
//  Reponse.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class Reponse: Identifiable, Codable {
    
    var _id: String
    var idParent: String
    var commentAuthor: String
    var commentDescription: String
    
    init(id: String, publication: String, description: String, auth: String) {
        self._id = id
        self.idParent = publication
        self.commentAuthor = auth
        self.commentDescription = description
    }
}
