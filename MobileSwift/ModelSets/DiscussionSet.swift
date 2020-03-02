//
//  DiscussionSet.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class DiscussionSet: ObservableObject{
    @Published var discussions: [Discussion]
    
    init(disc: [Discussion]){
        self.discussions = disc
    }
    
    func addDiscussion(p: Discussion){
        self.discussions.append(p)
    }
}
