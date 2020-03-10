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
        VStack{
            ForEach(self.discs.discussions){disc in
                DisPreview(disc: disc)
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
