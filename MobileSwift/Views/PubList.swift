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
        List(self.pubs.publications){pub in
            PubPreview(pub: pub)
        }
        
    }
}

struct PubList_Previews: PreviewProvider {
    static var previews: some View {
        PubList(pubs:PublicationSet(pubs: [Publication(titre: "Pub1", contenu: "Lorem Ipsum", note: 500), Publication(titre: "Pub2", contenu: "Lorem Ipsum", note: 200), Publication(titre: "Pub2", contenu: "Lorem Ipsum", note: 200), Publication(titre: "Pub2", contenu: "Lorem Ipsum", note: 200), Publication(titre: "Pub2", contenu: "Lorem Ipsum", note: 200)]))
    }
}
