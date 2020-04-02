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
    
    @State var commentaire : String = ""
    
    @Binding var showMenu : Bool
    
    var color : Color = .blue
    
    @ObservedObject var reponses : ReponseSet
    
    init(pub : Publication, showMenu: Binding<Bool>){
        self.pub = pub
        
        self._showMenu = showMenu
        
        // Fetch les reponses de la discussion
        
        let reps : [Reponse] = [
            Reponse(id: "", publication: "l", description: "Voila 1 commentaire", auth: "Pinoou"),
            Reponse(id: "", publication: "l", description: "Voila 1 autre", auth: "Pinoou")
        ]
        
        self.reponses = ReponseSet(rep : reps)
        
        // Fetch les categories des reponses
        
        
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
                        Text(/*self.pub.author*/ "pinou")
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
                    HStack{
                        Text("\(/*self.pub.note*/ 523)")
                        
                        Button(action: self.plus){
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }.buttonStyle(BorderlessButtonStyle())
                        
                        Divider()
                            .frame(height: 50)
                        
                        Text(self.pub.publicationTitle)
                            .font(.title)
                        
                        Spacer()
                    }
                    Divider()
                    ScrollView{
                        Text(self.pub.publicationDescription)
                    }.frame(maxHeight: metrics.size.height * 0.4)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
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
                    
                    RepList(reponses: self.reponses, color: .blue)
                }
            }
            .navigationBarItems(
                trailing: Button(action:{
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }
                ){
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                        .foregroundColor(self.color)
                }
            )
        }
    }
}

struct PubDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
