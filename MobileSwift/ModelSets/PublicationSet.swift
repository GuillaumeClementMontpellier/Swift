//
//  PublicationSet.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class PublicationSet: ObservableObject{
    @Published var publications: [Publication]
    
    init(pubs: [Publication]){
        self.publications = pubs
    }
    
    func addPublication(p: Publication){
        self.publications.append(p)
    }
}
