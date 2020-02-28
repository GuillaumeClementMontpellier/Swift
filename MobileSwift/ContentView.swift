//
//  ContentView.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pubSet: PublicationSet
    
    init(){
        let pubs: [Publication] = [Publication(titre: "Pub1", contenu: "Lorem Ipsum", note: 500), Publication(titre: "Pub2", contenu: "Lorem Ipsum", note: 200)]
        
        self.pubSet = PublicationSet(pubs: pubs)
    }
    
    var body: some View {
        VStack{
            Text("Hello, World!")
            PubList(pubs: pubSet)
                .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
