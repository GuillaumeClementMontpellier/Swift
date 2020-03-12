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
    
    var color : Color = .orange
    
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
    
    func post(){
        
    }
    
    func heart(){
        
    }
    
    func flag(){
        
    }
    
    func plus(){
        
    }
    
    var body: some View {
        GeometryReader { metrics in
            VStack{
                VStack{
                    //Discussion
                    HStack{
                        Text(self.dis.author)
                        Spacer()
                        
                        Spacer()
                        
                        Button(action: self.heart){
                            Image(systemName: "heart")
                                .imageScale(.large)
                        }
                        Button(action: self.flag){
                            Image(systemName: "flag")
                                .imageScale(.large)
                        }
                    }
                    
                    Divider()
                    HStack{
                        Text("\(self.dis.note)")
                        
                        // Sid eja plus, il disparait
                        Button(action: self.plus){
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                        
                        Divider()
                            .frame(height: 50)
                        
                        Text(self.dis.titre)
                            .font(.title)
                        
                        Spacer()
                    }.buttonStyle(BorderlessButtonStyle())
                    
                    
                    Divider()
                    
                    
                    ScrollView{
                        Text(self.dis.contenu)
                    }.frame(maxHeight: metrics.size.height * 0.4)
                }
                .padding()
                .foregroundColor(.white)
                .background(self.color)
                .cornerRadius(20)
                .padding()
                
                // Champ de reponses
                
                ScrollView {
                    HStack{
                        Image(systemName: "person")
                            .imageScale(.large)
                            .padding()
                        
                        VStack(alignment: .leading){
                            Text("Answer")
                            
                            TextView(text: self.$commentaire)
                                .frame(height: 100)
                                .cornerRadius(10)
                            
                            HStack{
                                
                                Spacer()
                                
                                Button(action: self.post){
                                    Text("Post")
                                }
                                .foregroundColor(self.color)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(1)
                                .background(self.color)
                                .cornerRadius(11)
                                
                            }
                            
                        }.padding()
                        
                    }
                    
                    // Liste des Reponses
                    
                    RepList(reponses: self.reponses, color: .orange)
                }
            }
        }
    }
    
    
}


struct DiscDetail_Previews: PreviewProvider {
    static var previews: some View {
        DiscDetail(dis: Discussion(titre: "Titre", contenu: "Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Visible Invisible", note: 1, auth: "Moi"))
    }
}
