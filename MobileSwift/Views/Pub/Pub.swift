//
//  Pub.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct PubDetail: View {
    
    var pub : Publication
    
    init(pub : Publication){
        self.pub = pub
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PubDetail_Previews: PreviewProvider {
    static var previews: some View {
        PubDetail(pub: Publication(titre: "Titre", contenu: "Contenu", note: 500, auth: "author"))
    }
}
