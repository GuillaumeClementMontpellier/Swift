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
    
    var color : Color
    
    @Binding var showMenu : Bool
    
    func plus(){
        
    }
    
    func dot(){
        
    }
    
    init(pub: Publication, color : Color, showMenu : Binding<Bool>) {
        self.pub = pub
        self.color = color
        self._showMenu = showMenu
        User.createUser(id: pub.publicationAuthor)
    }
    
    var body: some View {
        NavigationLink(destination: PubDetail(pub: pub, showMenu: self.$showMenu)){
            
            VStack{
                HStack{
                    Text(User.getUser(id: pub.publicationAuthor).userPseudo)
                    
                    Spacer()
                    
                    Button(action: self.dot){
                        Text("...")
                        // Menu deroulant : Signaler ou s'abonner
                    }
                }
                
                Divider()
                
                HStack{
                    
                    Text("\(/*pub.note*/ 521)")
                    Button(action: self.plus){
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                    
                    Divider()
                    
                    Text(pub.publicationTitle).font(.title)
                    
                    Spacer()
                    
                }
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(self.color)
        .cornerRadius(20)
    }
}


struct PubPreview_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
