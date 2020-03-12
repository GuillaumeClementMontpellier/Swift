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
    
    var color : Color
    
    var body: some View {
        ScrollView{
            ForEach(self.discs.discussions){disc in
                DisPreview(disc: disc, color : self.color)
                Divider()
            }
            Spacer()
        }
        
    }
}

struct DisList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
