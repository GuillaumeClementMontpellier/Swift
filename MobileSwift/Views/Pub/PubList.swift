//
//  PubList.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct PubList: View {
    @ObservedObject var pubs: PublicationSet
    
    var body: some View {
        VStack{
            ForEach(self.pubs.publications){pub in
                PubPreview(pub: pub)
                Divider()
            }
            Spacer()
        }
    }
}

struct PubList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
