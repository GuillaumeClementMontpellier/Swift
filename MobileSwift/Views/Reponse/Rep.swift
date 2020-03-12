//
//  Rep.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct Rep: View {
    
    var rep : Reponse
    
    @State var active = false
    
    var color: Color
    
    init(rep : Reponse, color : Color){
        self.rep = rep
        self.color = color
    }
    
    var body : some View{
        HStack(alignment: .top){
            
            Image(systemName: "person")
                .padding()
                .imageScale(.large)
            
            VStack(alignment: .trailing){
                Text(rep.contenu)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.white)
                    .padding(2)
                    .background(Color.gray)
                
                Spacer()
                
                !active ?
                    Button(action: {
                        withAnimation{
                            self.active.toggle()
                        }
                    }){
                        Text("Reply")
                    }.foregroundColor(self.color)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(1)
                        .background(self.color)
                        .cornerRadius(11)
                    : nil
                
                active ?
                    CreateRep(rep : self.rep, color: self.color)
                        .frame(height: 150)
                    : nil
                
            }
        }.padding(.trailing, 10)
    }
}

struct Rep_Previews: PreviewProvider {
    static var previews: some View {
        DiscDetail(dis: Discussion(titre: "Titre", contenu: "Content", note: 1, auth: "Moi"))
    }
}
