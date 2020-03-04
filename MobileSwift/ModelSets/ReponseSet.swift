//
//  ReponseSet.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class ReponseSet: ObservableObject{
    @Published var reponses: [Reponse]
    
    init(rep: [Reponse]){
        self.reponses = rep
    }
    
    func addReponse(p: Reponse){
        self.reponses.append(p)
    }
}
