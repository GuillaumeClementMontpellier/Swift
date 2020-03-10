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
            Reponse(contenu: "Voila un autre", note: -10, auth: "Pinoou")
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
        GeometryReader { metrics in
            VStack{
                VStack{
                    //Discussion
                    HStack{
                        Text(self.dis.author)
                        Spacer()
                        HStack{
                            Button(action: self.plus){
                                Image(systemName: "plus")
                                .imageScale(.large)
                            }
                            Text("\(self.dis.note)")
                            Button(action: self.minus){
                                Image(systemName: "minus")
                                .imageScale(.large)
                            }
                        }.buttonStyle(BorderlessButtonStyle())
                        
                        Spacer()
                        
                        Button(action: self.heart){
                            Image(systemName: "heart")
                            .imageScale(.large)
                        }.font(.headline)
                        Button(action: self.flag){
                            Image(systemName: "flag")
                            .imageScale(.large)
                        }
                    }
                    
                    Divider()
                    Text(self.dis.titre)
                        .font(.title)
                    Divider()
                    ScrollView{
                        Text(self.dis.contenu)
                    }.frame(maxHeight: metrics.size.height * 0.4)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(20)
                .padding()
                
                // Champ de reponses
                
                ScrollView {
                    HStack{
                        Image(systemName: "person")
                        .imageScale(.large)
                        
                        VStack(alignment: .leading){
                            Text("Answer")
                            TextView(text: self.$commentaire)
                                .frame(height: 100)
                                .cornerRadius(10)
                        }
                        
                    }.padding()
                    
                    // Liste des Reponses
                    
                    RepList(reponses: self.reponses)
                }
            }
        }//.modifier(AdaptsToKeyboard())
    }
    
    
}


struct DiscDetail_Previews: PreviewProvider {
    static var previews: some View {
        DiscDetail(dis: Discussion(titre: "Titre", contenu: "Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Visible Invisible", note: 1, auth: "Moi"))
    }
}
