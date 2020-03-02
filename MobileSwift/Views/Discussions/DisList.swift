//
//  DisList.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//


import SwiftUI

struct DisList: View {
    @ObservedObject var discs: DiscussionSet
    
    var body: some View {
        List(self.discs.discussions){disc in
            DisPreview(disc: disc)
        }
    }
}

struct DisList_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
