//
//  PubPreview.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct PubPreview: View {
    var pub : Publication
    
    var body: some View {
        VStack {
            Text(pub.titre)
            Text("\(pub.note)")
        }
        
    }
}

struct PubPreview_Previews: PreviewProvider {
    static var previews: some View {
        PubPreview(pub: Publication(titre: "Pub", contenu: "Lorem Ipsum", note: 500))
    }
}
