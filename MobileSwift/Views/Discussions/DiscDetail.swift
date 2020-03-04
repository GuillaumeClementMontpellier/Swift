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
    
    @State var commentaire : String = ""
    
    @ObservedObject var reponses : ReponseSet
    
    init(dis : Discussion){
        self.dis = dis
        
        // Fetch les reponses de la discussion
        
        let reps : [Reponse] = [
            Reponse(contenu: "Voila 1 commentaire", note: 10, auth: "Pinoou"),
            Reponse(contenu: "Voila un second", note: -10, auth: "Pinoou")
        ]
        
        self.reponses = ReponseSet(rep : reps)
    }
    
    func heart(){
        
    }
    
    func flag(){
        
    }
    
    func plus(){
        
    }
    
    func minus(){
        
    }
    
    var body: some View {
        VStack{
            VStack{
                //Discussion
                HStack{
                    Text(dis.author)
                    
                    Spacer()
                    
                    HStack{
                        Button(action: self.plus){
                            Image(systemName: "plus")
                        }
                        Text("\(dis.note)")
                        Button(action: self.minus){
                            Image(systemName: "minus")
                        }
                    }.buttonStyle(BorderlessButtonStyle())
                    
                    Spacer()
                    
                    Button(action: self.heart){
                        Image(systemName: "heart")
                    }.font(.headline)
                    Button(action: self.flag){
                        Image(systemName: "flag")
                    }
                }
                
                Divider()
                Text(dis.titre)
                    .font(.title)
                Divider()
                Text(dis.contenu)
                    .lineLimit(nil)
                
                
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.orange)
            .padding()
            
            // Champ de reponses
            
            HStack(alignment: .center){
                Image(systemName: "person").font(.largeTitle)
                
                VStack(alignment: .leading){
                    Text("Answer")
                    TextView(text: $commentaire)
                        .frame(height: 150)
                        .cornerRadius(10)
                }
                
            }.padding()
            
            
            // Liste des Reponses
            
            RepList(reponses: self.reponses)
            
        }
    }
}


struct DiscDetail_Previews: PreviewProvider {
    static var previews: some View {
        DiscDetail(dis: Discussion(titre: "Titre", contenu: "Content Content Content", note: 1, auth: "Moi"))
    }
}
