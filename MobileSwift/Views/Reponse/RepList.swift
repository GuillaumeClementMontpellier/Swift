//
//  RepList.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct RepList: View {
    @ObservedObject var reponses: ReponseSet
    
    var body: some View {
        VStack{
            ForEach(self.reponses.reponses){rep in
                Rep(rep: rep)
                Divider()
            }
            Spacer()
        }
    }
}

struct RepList_Previews: PreviewProvider {
    static var previews: some View {
        DiscDetail(dis: Discussion(titre: "Titre", contenu: "Content", note: 1, auth: "Moi"))
    }
}
