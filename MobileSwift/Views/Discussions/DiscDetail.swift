//
//  DiscDetail.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct DiscDetail: View {
    var dis : Discussion
    
    init(dis : Discussion){
        self.dis = dis
    }
    var body: some View {
        VStack{
            HStack{
                Text(dis.author)
                Spacer()
                Button(action: {}){
                    Text("...")
                }
            }
            Text(dis.titre).font(.title)
            HStack{
                Button(action: {}){
                    Image(systemName: "plus")
                }
                Text("\(dis.note)")
                Button(action: {}){
                    Image(systemName: "minus")
                }
            }.buttonStyle(BorderlessButtonStyle())
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.orange)
        .padding()
        
    }
}

struct DiscDetail_Previews: PreviewProvider {
    static var previews: some View {
        DiscDetail(dis: Discussion(titre: "Titre", contenu: "Content", note: 1, auth: "Moi"))
    }
}
